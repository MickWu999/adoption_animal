// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adoptionRepositoryHash() =>
    r'530824320e7a9327f7af25fa0caeb0bc249c5434';

/// See also [adoptionRepository].
@ProviderFor(adoptionRepository)
final adoptionRepositoryProvider = Provider<AdoptionRepository>.internal(
  adoptionRepository,
  name: r'adoptionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adoptionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdoptionRepositoryRef = ProviderRef<AdoptionRepository>;
String _$animalHash() => r'68b2d973581a55dafea89f5018cb513fe9d296f5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [animal].
@ProviderFor(animal)
const animalProvider = AnimalFamily();

/// See also [animal].
class AnimalFamily extends Family<Animal?> {
  /// See also [animal].
  const AnimalFamily();

  /// See also [animal].
  AnimalProvider call(String animalId) {
    return AnimalProvider(animalId);
  }

  @override
  AnimalProvider getProviderOverride(covariant AnimalProvider provider) {
    return call(provider.animalId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'animalProvider';
}

/// See also [animal].
class AnimalProvider extends AutoDisposeProvider<Animal?> {
  /// See also [animal].
  AnimalProvider(String animalId)
    : this._internal(
        (ref) => animal(ref as AnimalRef, animalId),
        from: animalProvider,
        name: r'animalProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$animalHash,
        dependencies: AnimalFamily._dependencies,
        allTransitiveDependencies: AnimalFamily._allTransitiveDependencies,
        animalId: animalId,
      );

  AnimalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.animalId,
  }) : super.internal();

  final String animalId;

  @override
  Override overrideWith(Animal? Function(AnimalRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: AnimalProvider._internal(
        (ref) => create(ref as AnimalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        animalId: animalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Animal?> createElement() {
    return _AnimalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimalProvider && other.animalId == animalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, animalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnimalRef on AutoDisposeProviderRef<Animal?> {
  /// The parameter `animalId` of this provider.
  String get animalId;
}

class _AnimalProviderElement extends AutoDisposeProviderElement<Animal?>
    with AnimalRef {
  _AnimalProviderElement(super.provider);

  @override
  String get animalId => (origin as AnimalProvider).animalId;
}

String _$shelterHash() => r'4cd0ac36a2456b0caa9715bd665422691e0cd807';

/// See also [shelter].
@ProviderFor(shelter)
const shelterProvider = ShelterFamily();

/// See also [shelter].
class ShelterFamily extends Family<Shelter?> {
  /// See also [shelter].
  const ShelterFamily();

  /// See also [shelter].
  ShelterProvider call(String shelterId) {
    return ShelterProvider(shelterId);
  }

  @override
  ShelterProvider getProviderOverride(covariant ShelterProvider provider) {
    return call(provider.shelterId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shelterProvider';
}

/// See also [shelter].
class ShelterProvider extends AutoDisposeProvider<Shelter?> {
  /// See also [shelter].
  ShelterProvider(String shelterId)
    : this._internal(
        (ref) => shelter(ref as ShelterRef, shelterId),
        from: shelterProvider,
        name: r'shelterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$shelterHash,
        dependencies: ShelterFamily._dependencies,
        allTransitiveDependencies: ShelterFamily._allTransitiveDependencies,
        shelterId: shelterId,
      );

  ShelterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shelterId,
  }) : super.internal();

  final String shelterId;

  @override
  Override overrideWith(Shelter? Function(ShelterRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: ShelterProvider._internal(
        (ref) => create(ref as ShelterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shelterId: shelterId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Shelter?> createElement() {
    return _ShelterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShelterProvider && other.shelterId == shelterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shelterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShelterRef on AutoDisposeProviderRef<Shelter?> {
  /// The parameter `shelterId` of this provider.
  String get shelterId;
}

class _ShelterProviderElement extends AutoDisposeProviderElement<Shelter?>
    with ShelterRef {
  _ShelterProviderElement(super.provider);

  @override
  String get shelterId => (origin as ShelterProvider).shelterId;
}

String _$shelterForAnimalHash() => r'af8b6f6319a43ea45da4ccd4df535f14dd4982ae';

/// See also [shelterForAnimal].
@ProviderFor(shelterForAnimal)
const shelterForAnimalProvider = ShelterForAnimalFamily();

/// See also [shelterForAnimal].
class ShelterForAnimalFamily extends Family<Shelter?> {
  /// See also [shelterForAnimal].
  const ShelterForAnimalFamily();

  /// See also [shelterForAnimal].
  ShelterForAnimalProvider call(String animalId) {
    return ShelterForAnimalProvider(animalId);
  }

  @override
  ShelterForAnimalProvider getProviderOverride(
    covariant ShelterForAnimalProvider provider,
  ) {
    return call(provider.animalId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shelterForAnimalProvider';
}

/// See also [shelterForAnimal].
class ShelterForAnimalProvider extends AutoDisposeProvider<Shelter?> {
  /// See also [shelterForAnimal].
  ShelterForAnimalProvider(String animalId)
    : this._internal(
        (ref) => shelterForAnimal(ref as ShelterForAnimalRef, animalId),
        from: shelterForAnimalProvider,
        name: r'shelterForAnimalProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$shelterForAnimalHash,
        dependencies: ShelterForAnimalFamily._dependencies,
        allTransitiveDependencies:
            ShelterForAnimalFamily._allTransitiveDependencies,
        animalId: animalId,
      );

  ShelterForAnimalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.animalId,
  }) : super.internal();

  final String animalId;

  @override
  Override overrideWith(
    Shelter? Function(ShelterForAnimalRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShelterForAnimalProvider._internal(
        (ref) => create(ref as ShelterForAnimalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        animalId: animalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Shelter?> createElement() {
    return _ShelterForAnimalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShelterForAnimalProvider && other.animalId == animalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, animalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShelterForAnimalRef on AutoDisposeProviderRef<Shelter?> {
  /// The parameter `animalId` of this provider.
  String get animalId;
}

class _ShelterForAnimalProviderElement
    extends AutoDisposeProviderElement<Shelter?>
    with ShelterForAnimalRef {
  _ShelterForAnimalProviderElement(super.provider);

  @override
  String get animalId => (origin as ShelterForAnimalProvider).animalId;
}

String _$animalsForShelterHash() => r'890da1221526cdcf92b4f5a86dfaefaac60d2c6c';

/// See also [animalsForShelter].
@ProviderFor(animalsForShelter)
const animalsForShelterProvider = AnimalsForShelterFamily();

/// See also [animalsForShelter].
class AnimalsForShelterFamily extends Family<List<Animal>> {
  /// See also [animalsForShelter].
  const AnimalsForShelterFamily();

  /// See also [animalsForShelter].
  AnimalsForShelterProvider call(String shelterId) {
    return AnimalsForShelterProvider(shelterId);
  }

  @override
  AnimalsForShelterProvider getProviderOverride(
    covariant AnimalsForShelterProvider provider,
  ) {
    return call(provider.shelterId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'animalsForShelterProvider';
}

/// See also [animalsForShelter].
class AnimalsForShelterProvider extends AutoDisposeProvider<List<Animal>> {
  /// See also [animalsForShelter].
  AnimalsForShelterProvider(String shelterId)
    : this._internal(
        (ref) => animalsForShelter(ref as AnimalsForShelterRef, shelterId),
        from: animalsForShelterProvider,
        name: r'animalsForShelterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$animalsForShelterHash,
        dependencies: AnimalsForShelterFamily._dependencies,
        allTransitiveDependencies:
            AnimalsForShelterFamily._allTransitiveDependencies,
        shelterId: shelterId,
      );

  AnimalsForShelterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shelterId,
  }) : super.internal();

  final String shelterId;

  @override
  Override overrideWith(
    List<Animal> Function(AnimalsForShelterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnimalsForShelterProvider._internal(
        (ref) => create(ref as AnimalsForShelterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shelterId: shelterId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Animal>> createElement() {
    return _AnimalsForShelterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimalsForShelterProvider && other.shelterId == shelterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shelterId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnimalsForShelterRef on AutoDisposeProviderRef<List<Animal>> {
  /// The parameter `shelterId` of this provider.
  String get shelterId;
}

class _AnimalsForShelterProviderElement
    extends AutoDisposeProviderElement<List<Animal>>
    with AnimalsForShelterRef {
  _AnimalsForShelterProviderElement(super.provider);

  @override
  String get shelterId => (origin as AnimalsForShelterProvider).shelterId;
}

String _$adoptionControllerHash() =>
    r'c93d9b1a6af77f6aabded889559c58f723170c9a';

/// See also [AdoptionController].
@ProviderFor(AdoptionController)
final adoptionControllerProvider =
    NotifierProvider<AdoptionController, AdoptionState>.internal(
      AdoptionController.new,
      name: r'adoptionControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adoptionControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdoptionController = Notifier<AdoptionState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
