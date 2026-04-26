// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_page_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchPageViewData {

 AnimalSearchParams get searchFilters; List<Animal> get results; List<String> get activeFilterLabels; bool get shouldShowLoading; bool get shouldShowEmptyState; bool get shouldShowFilterBar; bool get shouldShowClearAction; bool get shouldShowLoadMoreIndicator; bool get shouldShowLoadMoreTerminator; bool get canLoadNextPage; int get listItemCount; String get resultsHeadline;
/// Create a copy of SearchPageViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPageViewDataCopyWith<SearchPageViewData> get copyWith => _$SearchPageViewDataCopyWithImpl<SearchPageViewData>(this as SearchPageViewData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPageViewData&&(identical(other.searchFilters, searchFilters) || other.searchFilters == searchFilters)&&const DeepCollectionEquality().equals(other.results, results)&&const DeepCollectionEquality().equals(other.activeFilterLabels, activeFilterLabels)&&(identical(other.shouldShowLoading, shouldShowLoading) || other.shouldShowLoading == shouldShowLoading)&&(identical(other.shouldShowEmptyState, shouldShowEmptyState) || other.shouldShowEmptyState == shouldShowEmptyState)&&(identical(other.shouldShowFilterBar, shouldShowFilterBar) || other.shouldShowFilterBar == shouldShowFilterBar)&&(identical(other.shouldShowClearAction, shouldShowClearAction) || other.shouldShowClearAction == shouldShowClearAction)&&(identical(other.shouldShowLoadMoreIndicator, shouldShowLoadMoreIndicator) || other.shouldShowLoadMoreIndicator == shouldShowLoadMoreIndicator)&&(identical(other.shouldShowLoadMoreTerminator, shouldShowLoadMoreTerminator) || other.shouldShowLoadMoreTerminator == shouldShowLoadMoreTerminator)&&(identical(other.canLoadNextPage, canLoadNextPage) || other.canLoadNextPage == canLoadNextPage)&&(identical(other.listItemCount, listItemCount) || other.listItemCount == listItemCount)&&(identical(other.resultsHeadline, resultsHeadline) || other.resultsHeadline == resultsHeadline));
}


@override
int get hashCode => Object.hash(runtimeType,searchFilters,const DeepCollectionEquality().hash(results),const DeepCollectionEquality().hash(activeFilterLabels),shouldShowLoading,shouldShowEmptyState,shouldShowFilterBar,shouldShowClearAction,shouldShowLoadMoreIndicator,shouldShowLoadMoreTerminator,canLoadNextPage,listItemCount,resultsHeadline);

@override
String toString() {
  return 'SearchPageViewData(searchFilters: $searchFilters, results: $results, activeFilterLabels: $activeFilterLabels, shouldShowLoading: $shouldShowLoading, shouldShowEmptyState: $shouldShowEmptyState, shouldShowFilterBar: $shouldShowFilterBar, shouldShowClearAction: $shouldShowClearAction, shouldShowLoadMoreIndicator: $shouldShowLoadMoreIndicator, shouldShowLoadMoreTerminator: $shouldShowLoadMoreTerminator, canLoadNextPage: $canLoadNextPage, listItemCount: $listItemCount, resultsHeadline: $resultsHeadline)';
}


}

/// @nodoc
abstract mixin class $SearchPageViewDataCopyWith<$Res>  {
  factory $SearchPageViewDataCopyWith(SearchPageViewData value, $Res Function(SearchPageViewData) _then) = _$SearchPageViewDataCopyWithImpl;
@useResult
$Res call({
 AnimalSearchParams searchFilters, List<Animal> results, List<String> activeFilterLabels, bool shouldShowLoading, bool shouldShowEmptyState, bool shouldShowFilterBar, bool shouldShowClearAction, bool shouldShowLoadMoreIndicator, bool shouldShowLoadMoreTerminator, bool canLoadNextPage, int listItemCount, String resultsHeadline
});




}
/// @nodoc
class _$SearchPageViewDataCopyWithImpl<$Res>
    implements $SearchPageViewDataCopyWith<$Res> {
  _$SearchPageViewDataCopyWithImpl(this._self, this._then);

  final SearchPageViewData _self;
  final $Res Function(SearchPageViewData) _then;

/// Create a copy of SearchPageViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchFilters = null,Object? results = null,Object? activeFilterLabels = null,Object? shouldShowLoading = null,Object? shouldShowEmptyState = null,Object? shouldShowFilterBar = null,Object? shouldShowClearAction = null,Object? shouldShowLoadMoreIndicator = null,Object? shouldShowLoadMoreTerminator = null,Object? canLoadNextPage = null,Object? listItemCount = null,Object? resultsHeadline = null,}) {
  return _then(_self.copyWith(
searchFilters: null == searchFilters ? _self.searchFilters : searchFilters // ignore: cast_nullable_to_non_nullable
as AnimalSearchParams,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Animal>,activeFilterLabels: null == activeFilterLabels ? _self.activeFilterLabels : activeFilterLabels // ignore: cast_nullable_to_non_nullable
as List<String>,shouldShowLoading: null == shouldShowLoading ? _self.shouldShowLoading : shouldShowLoading // ignore: cast_nullable_to_non_nullable
as bool,shouldShowEmptyState: null == shouldShowEmptyState ? _self.shouldShowEmptyState : shouldShowEmptyState // ignore: cast_nullable_to_non_nullable
as bool,shouldShowFilterBar: null == shouldShowFilterBar ? _self.shouldShowFilterBar : shouldShowFilterBar // ignore: cast_nullable_to_non_nullable
as bool,shouldShowClearAction: null == shouldShowClearAction ? _self.shouldShowClearAction : shouldShowClearAction // ignore: cast_nullable_to_non_nullable
as bool,shouldShowLoadMoreIndicator: null == shouldShowLoadMoreIndicator ? _self.shouldShowLoadMoreIndicator : shouldShowLoadMoreIndicator // ignore: cast_nullable_to_non_nullable
as bool,shouldShowLoadMoreTerminator: null == shouldShowLoadMoreTerminator ? _self.shouldShowLoadMoreTerminator : shouldShowLoadMoreTerminator // ignore: cast_nullable_to_non_nullable
as bool,canLoadNextPage: null == canLoadNextPage ? _self.canLoadNextPage : canLoadNextPage // ignore: cast_nullable_to_non_nullable
as bool,listItemCount: null == listItemCount ? _self.listItemCount : listItemCount // ignore: cast_nullable_to_non_nullable
as int,resultsHeadline: null == resultsHeadline ? _self.resultsHeadline : resultsHeadline // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchPageViewData].
extension SearchPageViewDataPatterns on SearchPageViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchPageViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchPageViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchPageViewData value)  $default,){
final _that = this;
switch (_that) {
case _SearchPageViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchPageViewData value)?  $default,){
final _that = this;
switch (_that) {
case _SearchPageViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnimalSearchParams searchFilters,  List<Animal> results,  List<String> activeFilterLabels,  bool shouldShowLoading,  bool shouldShowEmptyState,  bool shouldShowFilterBar,  bool shouldShowClearAction,  bool shouldShowLoadMoreIndicator,  bool shouldShowLoadMoreTerminator,  bool canLoadNextPage,  int listItemCount,  String resultsHeadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchPageViewData() when $default != null:
return $default(_that.searchFilters,_that.results,_that.activeFilterLabels,_that.shouldShowLoading,_that.shouldShowEmptyState,_that.shouldShowFilterBar,_that.shouldShowClearAction,_that.shouldShowLoadMoreIndicator,_that.shouldShowLoadMoreTerminator,_that.canLoadNextPage,_that.listItemCount,_that.resultsHeadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnimalSearchParams searchFilters,  List<Animal> results,  List<String> activeFilterLabels,  bool shouldShowLoading,  bool shouldShowEmptyState,  bool shouldShowFilterBar,  bool shouldShowClearAction,  bool shouldShowLoadMoreIndicator,  bool shouldShowLoadMoreTerminator,  bool canLoadNextPage,  int listItemCount,  String resultsHeadline)  $default,) {final _that = this;
switch (_that) {
case _SearchPageViewData():
return $default(_that.searchFilters,_that.results,_that.activeFilterLabels,_that.shouldShowLoading,_that.shouldShowEmptyState,_that.shouldShowFilterBar,_that.shouldShowClearAction,_that.shouldShowLoadMoreIndicator,_that.shouldShowLoadMoreTerminator,_that.canLoadNextPage,_that.listItemCount,_that.resultsHeadline);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnimalSearchParams searchFilters,  List<Animal> results,  List<String> activeFilterLabels,  bool shouldShowLoading,  bool shouldShowEmptyState,  bool shouldShowFilterBar,  bool shouldShowClearAction,  bool shouldShowLoadMoreIndicator,  bool shouldShowLoadMoreTerminator,  bool canLoadNextPage,  int listItemCount,  String resultsHeadline)?  $default,) {final _that = this;
switch (_that) {
case _SearchPageViewData() when $default != null:
return $default(_that.searchFilters,_that.results,_that.activeFilterLabels,_that.shouldShowLoading,_that.shouldShowEmptyState,_that.shouldShowFilterBar,_that.shouldShowClearAction,_that.shouldShowLoadMoreIndicator,_that.shouldShowLoadMoreTerminator,_that.canLoadNextPage,_that.listItemCount,_that.resultsHeadline);case _:
  return null;

}
}

}

/// @nodoc


class _SearchPageViewData extends SearchPageViewData {
  const _SearchPageViewData({required this.searchFilters, required final  List<Animal> results, required final  List<String> activeFilterLabels, required this.shouldShowLoading, required this.shouldShowEmptyState, required this.shouldShowFilterBar, required this.shouldShowClearAction, required this.shouldShowLoadMoreIndicator, required this.shouldShowLoadMoreTerminator, required this.canLoadNextPage, required this.listItemCount, required this.resultsHeadline}): _results = results,_activeFilterLabels = activeFilterLabels,super._();
  

@override final  AnimalSearchParams searchFilters;
 final  List<Animal> _results;
@override List<Animal> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<String> _activeFilterLabels;
@override List<String> get activeFilterLabels {
  if (_activeFilterLabels is EqualUnmodifiableListView) return _activeFilterLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeFilterLabels);
}

@override final  bool shouldShowLoading;
@override final  bool shouldShowEmptyState;
@override final  bool shouldShowFilterBar;
@override final  bool shouldShowClearAction;
@override final  bool shouldShowLoadMoreIndicator;
@override final  bool shouldShowLoadMoreTerminator;
@override final  bool canLoadNextPage;
@override final  int listItemCount;
@override final  String resultsHeadline;

/// Create a copy of SearchPageViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchPageViewDataCopyWith<_SearchPageViewData> get copyWith => __$SearchPageViewDataCopyWithImpl<_SearchPageViewData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchPageViewData&&(identical(other.searchFilters, searchFilters) || other.searchFilters == searchFilters)&&const DeepCollectionEquality().equals(other._results, _results)&&const DeepCollectionEquality().equals(other._activeFilterLabels, _activeFilterLabels)&&(identical(other.shouldShowLoading, shouldShowLoading) || other.shouldShowLoading == shouldShowLoading)&&(identical(other.shouldShowEmptyState, shouldShowEmptyState) || other.shouldShowEmptyState == shouldShowEmptyState)&&(identical(other.shouldShowFilterBar, shouldShowFilterBar) || other.shouldShowFilterBar == shouldShowFilterBar)&&(identical(other.shouldShowClearAction, shouldShowClearAction) || other.shouldShowClearAction == shouldShowClearAction)&&(identical(other.shouldShowLoadMoreIndicator, shouldShowLoadMoreIndicator) || other.shouldShowLoadMoreIndicator == shouldShowLoadMoreIndicator)&&(identical(other.shouldShowLoadMoreTerminator, shouldShowLoadMoreTerminator) || other.shouldShowLoadMoreTerminator == shouldShowLoadMoreTerminator)&&(identical(other.canLoadNextPage, canLoadNextPage) || other.canLoadNextPage == canLoadNextPage)&&(identical(other.listItemCount, listItemCount) || other.listItemCount == listItemCount)&&(identical(other.resultsHeadline, resultsHeadline) || other.resultsHeadline == resultsHeadline));
}


@override
int get hashCode => Object.hash(runtimeType,searchFilters,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_activeFilterLabels),shouldShowLoading,shouldShowEmptyState,shouldShowFilterBar,shouldShowClearAction,shouldShowLoadMoreIndicator,shouldShowLoadMoreTerminator,canLoadNextPage,listItemCount,resultsHeadline);

@override
String toString() {
  return 'SearchPageViewData(searchFilters: $searchFilters, results: $results, activeFilterLabels: $activeFilterLabels, shouldShowLoading: $shouldShowLoading, shouldShowEmptyState: $shouldShowEmptyState, shouldShowFilterBar: $shouldShowFilterBar, shouldShowClearAction: $shouldShowClearAction, shouldShowLoadMoreIndicator: $shouldShowLoadMoreIndicator, shouldShowLoadMoreTerminator: $shouldShowLoadMoreTerminator, canLoadNextPage: $canLoadNextPage, listItemCount: $listItemCount, resultsHeadline: $resultsHeadline)';
}


}

/// @nodoc
abstract mixin class _$SearchPageViewDataCopyWith<$Res> implements $SearchPageViewDataCopyWith<$Res> {
  factory _$SearchPageViewDataCopyWith(_SearchPageViewData value, $Res Function(_SearchPageViewData) _then) = __$SearchPageViewDataCopyWithImpl;
@override @useResult
$Res call({
 AnimalSearchParams searchFilters, List<Animal> results, List<String> activeFilterLabels, bool shouldShowLoading, bool shouldShowEmptyState, bool shouldShowFilterBar, bool shouldShowClearAction, bool shouldShowLoadMoreIndicator, bool shouldShowLoadMoreTerminator, bool canLoadNextPage, int listItemCount, String resultsHeadline
});




}
/// @nodoc
class __$SearchPageViewDataCopyWithImpl<$Res>
    implements _$SearchPageViewDataCopyWith<$Res> {
  __$SearchPageViewDataCopyWithImpl(this._self, this._then);

  final _SearchPageViewData _self;
  final $Res Function(_SearchPageViewData) _then;

/// Create a copy of SearchPageViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchFilters = null,Object? results = null,Object? activeFilterLabels = null,Object? shouldShowLoading = null,Object? shouldShowEmptyState = null,Object? shouldShowFilterBar = null,Object? shouldShowClearAction = null,Object? shouldShowLoadMoreIndicator = null,Object? shouldShowLoadMoreTerminator = null,Object? canLoadNextPage = null,Object? listItemCount = null,Object? resultsHeadline = null,}) {
  return _then(_SearchPageViewData(
searchFilters: null == searchFilters ? _self.searchFilters : searchFilters // ignore: cast_nullable_to_non_nullable
as AnimalSearchParams,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Animal>,activeFilterLabels: null == activeFilterLabels ? _self._activeFilterLabels : activeFilterLabels // ignore: cast_nullable_to_non_nullable
as List<String>,shouldShowLoading: null == shouldShowLoading ? _self.shouldShowLoading : shouldShowLoading // ignore: cast_nullable_to_non_nullable
as bool,shouldShowEmptyState: null == shouldShowEmptyState ? _self.shouldShowEmptyState : shouldShowEmptyState // ignore: cast_nullable_to_non_nullable
as bool,shouldShowFilterBar: null == shouldShowFilterBar ? _self.shouldShowFilterBar : shouldShowFilterBar // ignore: cast_nullable_to_non_nullable
as bool,shouldShowClearAction: null == shouldShowClearAction ? _self.shouldShowClearAction : shouldShowClearAction // ignore: cast_nullable_to_non_nullable
as bool,shouldShowLoadMoreIndicator: null == shouldShowLoadMoreIndicator ? _self.shouldShowLoadMoreIndicator : shouldShowLoadMoreIndicator // ignore: cast_nullable_to_non_nullable
as bool,shouldShowLoadMoreTerminator: null == shouldShowLoadMoreTerminator ? _self.shouldShowLoadMoreTerminator : shouldShowLoadMoreTerminator // ignore: cast_nullable_to_non_nullable
as bool,canLoadNextPage: null == canLoadNextPage ? _self.canLoadNextPage : canLoadNextPage // ignore: cast_nullable_to_non_nullable
as bool,listItemCount: null == listItemCount ? _self.listItemCount : listItemCount // ignore: cast_nullable_to_non_nullable
as int,resultsHeadline: null == resultsHeadline ? _self.resultsHeadline : resultsHeadline // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
