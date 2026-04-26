// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnimalPage {

 List<Animal> get items; bool get hasMore;
/// Create a copy of AnimalPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimalPageCopyWith<AnimalPage> get copyWith => _$AnimalPageCopyWithImpl<AnimalPage>(this as AnimalPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimalPage&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),hasMore);

@override
String toString() {
  return 'AnimalPage(items: $items, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $AnimalPageCopyWith<$Res>  {
  factory $AnimalPageCopyWith(AnimalPage value, $Res Function(AnimalPage) _then) = _$AnimalPageCopyWithImpl;
@useResult
$Res call({
 List<Animal> items, bool hasMore
});




}
/// @nodoc
class _$AnimalPageCopyWithImpl<$Res>
    implements $AnimalPageCopyWith<$Res> {
  _$AnimalPageCopyWithImpl(this._self, this._then);

  final AnimalPage _self;
  final $Res Function(AnimalPage) _then;

/// Create a copy of AnimalPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Animal>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimalPage].
extension AnimalPagePatterns on AnimalPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimalPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimalPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimalPage value)  $default,){
final _that = this;
switch (_that) {
case _AnimalPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimalPage value)?  $default,){
final _that = this;
switch (_that) {
case _AnimalPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Animal> items,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimalPage() when $default != null:
return $default(_that.items,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Animal> items,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _AnimalPage():
return $default(_that.items,_that.hasMore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Animal> items,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _AnimalPage() when $default != null:
return $default(_that.items,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _AnimalPage implements AnimalPage {
  const _AnimalPage({required final  List<Animal> items, required this.hasMore}): _items = items;
  

 final  List<Animal> _items;
@override List<Animal> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  bool hasMore;

/// Create a copy of AnimalPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimalPageCopyWith<_AnimalPage> get copyWith => __$AnimalPageCopyWithImpl<_AnimalPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimalPage&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMore);

@override
String toString() {
  return 'AnimalPage(items: $items, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$AnimalPageCopyWith<$Res> implements $AnimalPageCopyWith<$Res> {
  factory _$AnimalPageCopyWith(_AnimalPage value, $Res Function(_AnimalPage) _then) = __$AnimalPageCopyWithImpl;
@override @useResult
$Res call({
 List<Animal> items, bool hasMore
});




}
/// @nodoc
class __$AnimalPageCopyWithImpl<$Res>
    implements _$AnimalPageCopyWith<$Res> {
  __$AnimalPageCopyWithImpl(this._self, this._then);

  final _AnimalPage _self;
  final $Res Function(_AnimalPage) _then;

/// Create a copy of AnimalPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMore = null,}) {
  return _then(_AnimalPage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Animal>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
