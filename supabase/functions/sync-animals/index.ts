import { createClient } from "npm:@supabase/supabase-js@2";

const supabase = createClient(
  Deno.env.get("APP_SUPABASE_URL")!,
  Deno.env.get("APP_SUPABASE_SECRET_KEY")!,
);

const FUNCTION_SECRET = Deno.env.get("FUNCTION_SECRET")?.trim();
  
if (!FUNCTION_SECRET || FUNCTION_SECRET.length < 8) {
  throw new Error(
    "Missing or unsafe FUNCTION_SECRET environment variable. Use at least 32 characters.",
  );
}

const API_URL =
  "https://data.moa.gov.tw/Service/OpenData/TransService.aspx?UnitId=QcbUEzN6E6DL";

const PAGE_SIZE = 1000;
const BATCH_SIZE = 500;
const SELECT_PAGE_SIZE = 1000;
const SOURCE_SYSTEM = "moa_animal_api";

type GovernmentAnimal = {
  animal_id: number | string;
  animal_subid?: string;
  animal_area_pkid?: number;
  animal_shelter_pkid?: number;
  animal_place?: string;
  animal_kind?: string;
  animal_Variety?: string;
  animal_sex?: string;
  animal_bodytype?: string;
  animal_colour?: string;
  animal_age?: string;
  animal_sterilization?: string;
  animal_bacterin?: string;
  animal_foundplace?: string;
  animal_status?: string;
  animal_opendate?: string;
  animal_title?: string;
  album_file?: string;
  shelter_name?: string;
  shelter_address?: string;
  shelter_tel?: string;
};

function toDate(value?: string): string | null {
  if (!value) return null;

  const trimmed = value.trim();

  if (/^\d{4}-\d{2}-\d{2}$/.test(trimmed)) {
    return trimmed;
  }

  return null;
}

function stableStringify(value: unknown): string {
  if (value === null || typeof value !== "object") {
    return JSON.stringify(value);
  }

  if (Array.isArray(value)) {
    return `[${value.map((item) => stableStringify(item)).join(",")}]`;
  }

  const objectValue = value as Record<string, unknown>;
  const keys = Object.keys(objectValue).sort();

  return `{${keys
    .map((key) => `${JSON.stringify(key)}:${stableStringify(objectValue[key])}`)
    .join(",")}}`;
}

async function sha256(value: string): Promise<string> {
  const data = new TextEncoder().encode(value);
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));

  return hashArray.map((byte) => byte.toString(16).padStart(2, "0")).join("");
}

function animalKey(animalId: string, shelterPkid: number): string {
  return `${animalId}:${shelterPkid}`;
}

async function chunkedUpdate(
  table: string,
  ids: string[],
  values: Record<string, unknown>,
): Promise<void> {
  for (let i = 0; i < ids.length; i += BATCH_SIZE) {
    const batch = ids.slice(i, i + BATCH_SIZE);
    const { error } = await supabase.from(table).update(values).in("id", batch);

    if (error) throw error;
  }
}

type ExistingAnimal = {
  id: string;
  animal_id: string | number;
  animal_shelter_pkid: number;
  last_payload_hash: string | null;
  availability_status: string | null;
};

type MissingAnimal = {
  id: string;
  missed_sync_count: number | null;
  availability_status: string | null;
};

async function fetchAllExistingAnimals(): Promise<ExistingAnimal[]> {
  const allRows: ExistingAnimal[] = [];
  let from = 0;

  while (true) {
    const to = from + SELECT_PAGE_SIZE - 1;

    const { data, error } = await supabase
      .from("animals")
      .select(
        "id, animal_id, animal_shelter_pkid, last_payload_hash, availability_status",
      )
      .eq("source_system", SOURCE_SYSTEM)
      .range(from, to);

    if (error) throw error;

    const rows = (data ?? []) as ExistingAnimal[];
    allRows.push(...rows);

    if (rows.length < SELECT_PAGE_SIZE) {
      break;
    }

    from += SELECT_PAGE_SIZE;
  }

  return allRows;
}

async function fetchAllMissingCandidates(
  syncStartedAt: string,
): Promise<MissingAnimal[]> {
  const allRows: MissingAnimal[] = [];
  let from = 0;

  while (true) {
    const to = from + SELECT_PAGE_SIZE - 1;

    const { data, error } = await supabase
      .from("animals")
      .select("id, missed_sync_count, availability_status")
      .eq("source_system", SOURCE_SYSTEM)
      .lt("synced_at", syncStartedAt)
      .neq("availability_status", "left_shelter")
      .range(from, to);

    if (error) throw error;

    const rows = (data ?? []) as MissingAnimal[];
    allRows.push(...rows);

    if (rows.length < SELECT_PAGE_SIZE) {
      break;
    }

    from += SELECT_PAGE_SIZE;
  }

  return allRows;
}

async function fetchAllAnimals(): Promise<GovernmentAnimal[]> {
  const allAnimals: GovernmentAnimal[] = [];
  let skip = 0;

  while (true) {
    const url = `${API_URL}&$top=${PAGE_SIZE}&$skip=${skip}`;

    const response = await fetch(url);
    console.log(`Fetched government API page: skip=${skip}`);

    if (!response.ok) {
      throw new Error(`Government API failed: ${response.status}`);
    }

    const page = (await response.json()) as GovernmentAnimal[];

    allAnimals.push(...page);

    if (page.length < PAGE_SIZE) {
      break;
    }

    skip += PAGE_SIZE;
  }

  return allAnimals;
}

Deno.serve(async (req) => {
  const authorization = req.headers.get("authorization")?.trim();
  const apiKey = req.headers.get("apikey")?.trim();
  const expectedBearer = `Bearer ${FUNCTION_SECRET}`;

  if (authorization !== expectedBearer && apiKey !== FUNCTION_SECRET) {
    return Response.json(
      {
        ok: false,
        error: "Unauthorized",
      },
      { status: 401 },
    );
  }

  const syncStartedAt = new Date().toISOString();
  let runId: string | null = null;

  try {
    const { data: run, error: runError } = await supabase
      .from("animal_sync_runs")
      .insert({
        source_system: SOURCE_SYSTEM,
        status: "running",
        started_at: syncStartedAt,
      })
      .select("id")
      .single();

    if (runError) throw runError;

    runId = run.id;

    const animals = await fetchAllAnimals();
    console.log(`Fetched animals: ${animals.length}`);

    const validAnimals = animals.filter(
      (animal) => animal.animal_id && animal.animal_shelter_pkid,
    );
    const invalidCount = animals.length - validAnimals.length;

    const shelterPkids = [
      ...new Set(
        validAnimals.map((animal) => Number(animal.animal_shelter_pkid)),
      ),
    ];

    const { data: mappings, error: mappingError } = await supabase
      .from("shelter_source_mappings")
      .select("shelter_id, source_shelter_pkid")
      .eq("source_system", SOURCE_SYSTEM)
      .in("source_shelter_pkid", shelterPkids);

    if (mappingError) throw mappingError;

    const shelterIdByPkid = new Map<number, string>();

    for (const mapping of mappings ?? []) {
      if (mapping.source_shelter_pkid !== null) {
        shelterIdByPkid.set(
          Number(mapping.source_shelter_pkid),
          mapping.shelter_id,
        );
      }
    }

    const existingAnimals = await fetchAllExistingAnimals();

    const existingByKey = new Map<
      string,
      {
        id: string;
        last_payload_hash: string;
        availability_status: string;
      }
    >();

    for (const existing of existingAnimals ?? []) {
      existingByKey.set(
        animalKey(String(existing.animal_id), Number(existing.animal_shelter_pkid)),
        {
          id: existing.id,
          last_payload_hash: existing.last_payload_hash ?? "",
          availability_status: existing.availability_status ?? "available",
        },
      );
    }

    const now = new Date().toISOString();

    let insertedCount = 0;
    let updatedCount = 0;
    let unchangedCount = 0;

    const rows = await Promise.all(
      validAnimals.map(async (animal) => {
        const shelterPkid = Number(animal.animal_shelter_pkid);
        const currentAnimalKey = animalKey(String(animal.animal_id), shelterPkid);
        const payloadHash = await sha256(stableStringify(animal));
        const existing = existingByKey.get(currentAnimalKey);

        if (!existing) {
          insertedCount += 1;
        } else if (existing.last_payload_hash !== payloadHash) {
          updatedCount += 1;
        } else {
          unchangedCount += 1;
        }

        return {
          shelter_id: shelterIdByPkid.get(shelterPkid) ?? null,
          source_system: SOURCE_SYSTEM,
          animal_id: String(animal.animal_id),
          animal_subid: animal.animal_subid ?? "",
          animal_area_pkid: Number(animal.animal_area_pkid ?? 0),
          animal_shelter_pkid: shelterPkid,
          animal_place: animal.animal_place ?? "",
          animal_kind: animal.animal_kind ?? "",
          animal_variety: animal.animal_Variety ?? "",
          animal_sex: animal.animal_sex ?? "",
          animal_bodytype: animal.animal_bodytype ?? "",
          animal_colour: animal.animal_colour ?? "",
          animal_age: animal.animal_age ?? "",
          animal_sterilization: animal.animal_sterilization ?? "",
          animal_bacterin: animal.animal_bacterin ?? "",
          animal_foundplace: animal.animal_foundplace ?? "",
          animal_status: animal.animal_status ?? "",
          animal_opendate: toDate(animal.animal_opendate),
          animal_title: animal.animal_title ?? "",
          album_file: animal.album_file ?? "",
          shelter_name_snapshot: animal.shelter_name ?? "",
          shelter_address_snapshot: animal.shelter_address ?? "",
          shelter_tel_snapshot: animal.shelter_tel ?? "",
          availability_status: "available",
          missed_sync_count: 0,
          last_seen_at: now,
          synced_at: now,
          raw_payload: animal,
          last_payload_hash: payloadHash,
          sync_run_id: runId,
          status_changed_at:
            existing && existing.availability_status !== "available" ? now : undefined,
          updated_at: now,
        };
      }),
    );

    let upsertedCount = 0;

    for (let i = 0; i < rows.length; i += BATCH_SIZE) {
      const batch = rows.slice(i, i + BATCH_SIZE);

      const { error } = await supabase.from("animals").upsert(batch, {
        onConflict: "source_system,animal_id,animal_shelter_pkid",
      });

      if (error) throw error;

      upsertedCount += batch.length;
    }

    const missingRowsSafe = await fetchAllMissingCandidates(syncStartedAt);

    const missingByNextCount = new Map<number, string[]>();
    const newlyMissingIds: string[] = [];
    const leftShelterIds: string[] = [];

    for (const row of missingRowsSafe) {
      const nextMissedCount = Number(row.missed_sync_count ?? 0) + 1;

      if (nextMissedCount >= 3) {
        leftShelterIds.push(row.id);
        continue;
      }

      const ids = missingByNextCount.get(nextMissedCount) ?? [];
      ids.push(row.id);
      missingByNextCount.set(nextMissedCount, ids);

      if (row.availability_status !== "missing") {
        newlyMissingIds.push(row.id);
      }
    }

    let markedMissingCount = 0;
    let markedLeftCount = 0;

    for (const [nextMissedCount, ids] of missingByNextCount.entries()) {
      await chunkedUpdate("animals", ids, {
        availability_status: "missing",
        missed_sync_count: nextMissedCount,
        updated_at: now,
      });

      markedMissingCount += ids.length;
    }

    if (newlyMissingIds.length > 0) {
      await chunkedUpdate("animals", newlyMissingIds, {
        status_changed_at: now,
        updated_at: now,
      });
    }

    if (leftShelterIds.length > 0) {
      await chunkedUpdate("animals", leftShelterIds, {
        availability_status: "left_shelter",
        missed_sync_count: 3,
        status_changed_at: now,
        updated_at: now,
      });

      markedLeftCount = leftShelterIds.length;
    }

    await supabase
      .from("animal_sync_runs")
      .update({
        status: "success",
        finished_at: now,
        fetched_count: animals.length,
        upserted_count: upsertedCount,
        inserted_count: insertedCount,
        updated_count: updatedCount,
        unchanged_count: unchangedCount,
        invalid_count: invalidCount,
        marked_missing_count: markedMissingCount,
        marked_left_count: markedLeftCount,
      })
      .eq("id", runId);

    return Response.json({
      ok: true,
      fetched: animals.length,
      valid: validAnimals.length,
      upserted: upsertedCount,
      inserted: insertedCount,
      updated: updatedCount,
      unchanged: unchangedCount,
      invalid: invalidCount,
      marked_missing: markedMissingCount,
      marked_left: markedLeftCount,
    });
  } catch (error) {
    const message = error instanceof Error ? error.message : String(error);

    if (runId) {
      await supabase
        .from("animal_sync_runs")
        .update({
          status: "failed",
          finished_at: new Date().toISOString(),
          error_message: message,
        })
        .eq("id", runId);
    }

    return Response.json(
      {
        ok: false,
        error: message,
      },
      { status: 500 },
    );
  }
});