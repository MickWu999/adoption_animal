// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adoption_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdoptionState {

 int get currentTab; String get searchQuery; AnimalSearchParams get searchFilters; FavoriteFilter get favoriteFilter; List<Animal> get animals; List<Shelter> get shelters; List<NoticeItem> get notifications; List<HomeCategory> get homeCategories; bool get isInitialLoading; bool get isLoadingMore; bool get hasMoreAnimals;
/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdoptionStateCopyWith<AdoptionState> get copyWith => _$AdoptionStateCopyWithImpl<AdoptionState>(this as AdoptionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdoptionState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.searchFilters, searchFilters) || other.searchFilters == searchFilters)&&(identical(other.favoriteFilter, favoriteFilter) || other.favoriteFilter == favoriteFilter)&&const DeepCollectionEquality().equals(other.animals, animals)&&const DeepCollectionEquality().equals(other.shelters, shelters)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&const DeepCollectionEquality().equals(other.homeCategories, homeCategories)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMoreAnimals, hasMoreAnimals) || other.hasMoreAnimals == hasMoreAnimals));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,searchQuery,searchFilters,favoriteFilter,const DeepCollectionEquality().hash(animals),const DeepCollectionEquality().hash(shelters),const DeepCollectionEquality().hash(notifications),const DeepCollectionEquality().hash(homeCategories),isInitialLoading,isLoadingMore,hasMoreAnimals);

@override
String toString() {
  return 'AdoptionState(currentTab: $currentTab, searchQuery: $searchQuery, searchFilters: $searchFilters, favoriteFilter: $favoriteFilter, animals: $animals, shelters: $shelters, notifications: $notifications, homeCategories: $homeCategories, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, hasMoreAnimals: $hasMoreAnimals)';
}


}

/// @nodoc
abstract mixin class $AdoptionStateCopyWith<$Res>  {
  factory $AdoptionStateCopyWith(AdoptionState value, $Res Function(AdoptionState) _then) = _$AdoptionStateCopyWithImpl;
@useResult
$Res call({
 int currentTab, String searchQuery, AnimalSearchParams searchFilters, FavoriteFilter favoriteFilter, List<Animal> animals, List<Shelter> shelters, List<NoticeItem> notifications, List<HomeCategory> homeCategories, bool isInitialLoading, bool isLoadingMore, bool hasMoreAnimals
});




}
/// @nodoc
class _$AdoptionStateCopyWithImpl<$Res>
    implements $AdoptionStateCopyWith<$Res> {
  _$AdoptionStateCopyWithImpl(this._self, this._then);

  final AdoptionState _self;
  final $Res Function(AdoptionState) _then;

/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? searchQuery = null,Object? searchFilters = null,Object? favoriteFilter = null,Object? animals = null,Object? shelters = null,Object? notifications = null,Object? homeCategories = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? hasMoreAnimals = null,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,searchFilters: null == searchFilters ? _self.searchFilters : searchFilters // ignore: cast_nullable_to_non_nullable
as AnimalSearchParams,favoriteFilter: null == favoriteFilter ? _self.favoriteFilter : favoriteFilter // ignore: cast_nullable_to_non_nullable
as FavoriteFilter,animals: null == animals ? _self.animals : animals // ignore: cast_nullable_to_non_nullable
as List<Animal>,shelters: null == shelters ? _self.shelters : shelters // ignore: cast_nullable_to_non_nullable
as List<Shelter>,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NoticeItem>,homeCategories: null == homeCategories ? _self.homeCategories : homeCategories // ignore: cast_nullable_to_non_nullable
as List<HomeCategory>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMoreAnimals: null == hasMoreAnimals ? _self.hasMoreAnimals : hasMoreAnimals // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdoptionState].
extension AdoptionStatePatterns on AdoptionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdoptionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdoptionState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdoptionState value)  $default,){
final _that = this;
switch (_that) {
case _AdoptionState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdoptionState value)?  $default,){
final _that = this;
switch (_that) {
case _AdoptionState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentTab,  String searchQuery,  AnimalSearchParams searchFilters,  FavoriteFilter favoriteFilter,  List<Animal> animals,  List<Shelter> shelters,  List<NoticeItem> notifications,  List<HomeCategory> homeCategories,  bool isInitialLoading,  bool isLoadingMore,  bool hasMoreAnimals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdoptionState() when $default != null:
return $default(_that.currentTab,_that.searchQuery,_that.searchFilters,_that.favoriteFilter,_that.animals,_that.shelters,_that.notifications,_that.homeCategories,_that.isInitialLoading,_that.isLoadingMore,_that.hasMoreAnimals);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentTab,  String searchQuery,  AnimalSearchParams searchFilters,  FavoriteFilter favoriteFilter,  List<Animal> animals,  List<Shelter> shelters,  List<NoticeItem> notifications,  List<HomeCategory> homeCategories,  bool isInitialLoading,  bool isLoadingMore,  bool hasMoreAnimals)  $default,) {final _that = this;
switch (_that) {
case _AdoptionState():
return $default(_that.currentTab,_that.searchQuery,_that.searchFilters,_that.favoriteFilter,_that.animals,_that.shelters,_that.notifications,_that.homeCategories,_that.isInitialLoading,_that.isLoadingMore,_that.hasMoreAnimals);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentTab,  String searchQuery,  AnimalSearchParams searchFilters,  FavoriteFilter favoriteFilter,  List<Animal> animals,  List<Shelter> shelters,  List<NoticeItem> notifications,  List<HomeCategory> homeCategories,  bool isInitialLoading,  bool isLoadingMore,  bool hasMoreAnimals)?  $default,) {final _that = this;
switch (_that) {
case _AdoptionState() when $default != null:
return $default(_that.currentTab,_that.searchQuery,_that.searchFilters,_that.favoriteFilter,_that.animals,_that.shelters,_that.notifications,_that.homeCategories,_that.isInitialLoading,_that.isLoadingMore,_that.hasMoreAnimals);case _:
  return null;

}
}

}

/// @nodoc


class _AdoptionState extends AdoptionState {
  const _AdoptionState({required this.currentTab, required this.searchQuery, required this.searchFilters, required this.favoriteFilter, required final  List<Animal> animals, required final  List<Shelter> shelters, required final  List<NoticeItem> notifications, required final  List<HomeCategory> homeCategories, required this.isInitialLoading, required this.isLoadingMore, required this.hasMoreAnimals}): _animals = animals,_shelters = shelters,_notifications = notifications,_homeCategories = homeCategories,super._();
  

@override final  int currentTab;
@override final  String searchQuery;
@override final  AnimalSearchParams searchFilters;
@override final  FavoriteFilter favoriteFilter;
 final  List<Animal> _animals;
@override List<Animal> get animals {
  if (_animals is EqualUnmodifiableListView) return _animals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_animals);
}

 final  List<Shelter> _shelters;
@override List<Shelter> get shelters {
  if (_shelters is EqualUnmodifiableListView) return _shelters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shelters);
}

 final  List<NoticeItem> _notifications;
@override List<NoticeItem> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  List<HomeCategory> _homeCategories;
@override List<HomeCategory> get homeCategories {
  if (_homeCategories is EqualUnmodifiableListView) return _homeCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homeCategories);
}

@override final  bool isInitialLoading;
@override final  bool isLoadingMore;
@override final  bool hasMoreAnimals;

/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdoptionStateCopyWith<_AdoptionState> get copyWith => __$AdoptionStateCopyWithImpl<_AdoptionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdoptionState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.searchFilters, searchFilters) || other.searchFilters == searchFilters)&&(identical(other.favoriteFilter, favoriteFilter) || other.favoriteFilter == favoriteFilter)&&const DeepCollectionEquality().equals(other._animals, _animals)&&const DeepCollectionEquality().equals(other._shelters, _shelters)&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&const DeepCollectionEquality().equals(other._homeCategories, _homeCategories)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMoreAnimals, hasMoreAnimals) || other.hasMoreAnimals == hasMoreAnimals));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,searchQuery,searchFilters,favoriteFilter,const DeepCollectionEquality().hash(_animals),const DeepCollectionEquality().hash(_shelters),const DeepCollectionEquality().hash(_notifications),const DeepCollectionEquality().hash(_homeCategories),isInitialLoading,isLoadingMore,hasMoreAnimals);

@override
String toString() {
  return 'AdoptionState(currentTab: $currentTab, searchQuery: $searchQuery, searchFilters: $searchFilters, favoriteFilter: $favoriteFilter, animals: $animals, shelters: $shelters, notifications: $notifications, homeCategories: $homeCategories, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, hasMoreAnimals: $hasMoreAnimals)';
}


}

/// @nodoc
abstract mixin class _$AdoptionStateCopyWith<$Res> implements $AdoptionStateCopyWith<$Res> {
  factory _$AdoptionStateCopyWith(_AdoptionState value, $Res Function(_AdoptionState) _then) = __$AdoptionStateCopyWithImpl;
@override @useResult
$Res call({
 int currentTab, String searchQuery, AnimalSearchParams searchFilters, FavoriteFilter favoriteFilter, List<Animal> animals, List<Shelter> shelters, List<NoticeItem> notifications, List<HomeCategory> homeCategories, bool isInitialLoading, bool isLoadingMore, bool hasMoreAnimals
});




}
/// @nodoc
class __$AdoptionStateCopyWithImpl<$Res>
    implements _$AdoptionStateCopyWith<$Res> {
  __$AdoptionStateCopyWithImpl(this._self, this._then);

  final _AdoptionState _self;
  final $Res Function(_AdoptionState) _then;

/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? searchQuery = null,Object? searchFilters = null,Object? favoriteFilter = null,Object? animals = null,Object? shelters = null,Object? notifications = null,Object? homeCategories = null,Object? isInitialLoading = null,Object? isLoadingMore = null,Object? hasMoreAnimals = null,}) {
  return _then(_AdoptionState(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,searchFilters: null == searchFilters ? _self.searchFilters : searchFilters // ignore: cast_nullable_to_non_nullable
as AnimalSearchParams,favoriteFilter: null == favoriteFilter ? _self.favoriteFilter : favoriteFilter // ignore: cast_nullable_to_non_nullable
as FavoriteFilter,animals: null == animals ? _self._animals : animals // ignore: cast_nullable_to_non_nullable
as List<Animal>,shelters: null == shelters ? _self._shelters : shelters // ignore: cast_nullable_to_non_nullable
as List<Shelter>,notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NoticeItem>,homeCategories: null == homeCategories ? _self._homeCategories : homeCategories // ignore: cast_nullable_to_non_nullable
as List<HomeCategory>,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMoreAnimals: null == hasMoreAnimals ? _self.hasMoreAnimals : hasMoreAnimals // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
