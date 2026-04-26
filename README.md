# adoption_animal

以 Flutter 建立的動物認養 App 範例專案，採用 `feature-first` 架構，並以 `flutter_riverpod`、`riverpod_generator`、`freezed`、`json_serializable` 組成可擴充、可維護的大型專案基礎。

## 技術選型

- `flutter_riverpod`: 狀態管理與依賴注入
- `riverpod_generator`: 產生 provider，減少樣板程式碼
- `freezed`: 建立不可變 state/model 與 `copyWith`
- `json_serializable`: 產生 `toJson/fromJson`
- `go_router`: 路由管理
- `dio`: API 存取

## 專案架構

```text
lib/
├── app/                         # App 入口與路由
├── core/                        # 全域共用主題、lookup、responsive 工具
├── features/
│   └── adoption/
│       ├── data/                # Repository、DTO、Mapper
│       ├── domain/              # Entity / Domain model
│       └── presentation/        # Page、Widget、Controller、State
├── main.dart
└── models/                      # 舊路徑相容出口
```

### 模組規範

- 每個功能模組都維持自己的 `presentation / domain / data` 分層。
- 每個功能模組都建立獨立的 State Class，例如 `AdoptionState`。
- `presentation/controllers` 負責 Riverpod provider 與狀態操作。
- `data/models` 放 API query/response model，若需序列化一律優先使用 `freezed + json_serializable`。
- `domain/models` 放畫面與業務邏輯使用的 domain entity。

## 開發指令

### 1. 安裝套件

```bash
flutter pub get
```

### 2. 產生 Generator 檔案

```bash
dart run build_runner build --delete-conflicting-outputs
```

持續開發時可使用：

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### 3. 檢查程式碼

```bash
flutter analyze
```

### 4. 執行專案

```bash
flutter run
```

## 使用方式

### 新增一個功能模組

1. 在 `lib/features/` 下建立新模組資料夾，例如 `auth/`。
2. 依序建立：
   `data/`
   `domain/`
   `presentation/`
3. 在 `presentation/controllers/` 建立模組專屬 `state` 與 `controller`。
4. `state` 使用 `freezed`，`controller` 使用 `@riverpod` 或 `@Riverpod`。
5. 若 model 需要序列化，加入 `part` 檔並執行 `build_runner`。

### Riverpod Generator 範例

```dart
@Riverpod(keepAlive: true)
class ExampleController extends _$ExampleController {
  @override
  ExampleState build() => const ExampleState();
}
```

### Freezed State 範例

```dart
@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({
    required bool isLoading,
    required List<String> items,
  }) = _ExampleState;
}
```

## 維護原則

- 優先保持單一職責，避免 page 直接承擔資料組裝邏輯。
- Provider 與狀態集中在模組內管理，不跨 feature 直接依賴細節。
- 加入適度註解，說明設計原因與轉換邏輯，不堆砌無意義註解。
- 所有變更都以 `flutter analyze` 通過為最低標準。
