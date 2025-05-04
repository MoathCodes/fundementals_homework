// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppRoute {

 String get path; String get label; IconData get icon; Widget get child;
/// Create a copy of AppRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppRouteCopyWith<AppRoute> get copyWith => _$AppRouteCopyWithImpl<AppRoute>(this as AppRoute, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppRoute&&(identical(other.path, path) || other.path == path)&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,path,label,icon,child);

@override
String toString() {
  return 'AppRoute(path: $path, label: $label, icon: $icon, child: $child)';
}


}

/// @nodoc
abstract mixin class $AppRouteCopyWith<$Res>  {
  factory $AppRouteCopyWith(AppRoute value, $Res Function(AppRoute) _then) = _$AppRouteCopyWithImpl;
@useResult
$Res call({
 String path, String label, IconData icon, Widget child
});




}
/// @nodoc
class _$AppRouteCopyWithImpl<$Res>
    implements $AppRouteCopyWith<$Res> {
  _$AppRouteCopyWithImpl(this._self, this._then);

  final AppRoute _self;
  final $Res Function(AppRoute) _then;

/// Create a copy of AppRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? label = null,Object? icon = null,Object? child = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}

}


/// @nodoc


class _AppRoute implements AppRoute {
  const _AppRoute({required this.path, required this.label, required this.icon, required this.child});
  

@override final  String path;
@override final  String label;
@override final  IconData icon;
@override final  Widget child;

/// Create a copy of AppRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppRouteCopyWith<_AppRoute> get copyWith => __$AppRouteCopyWithImpl<_AppRoute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppRoute&&(identical(other.path, path) || other.path == path)&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,path,label,icon,child);

@override
String toString() {
  return 'AppRoute(path: $path, label: $label, icon: $icon, child: $child)';
}


}

/// @nodoc
abstract mixin class _$AppRouteCopyWith<$Res> implements $AppRouteCopyWith<$Res> {
  factory _$AppRouteCopyWith(_AppRoute value, $Res Function(_AppRoute) _then) = __$AppRouteCopyWithImpl;
@override @useResult
$Res call({
 String path, String label, IconData icon, Widget child
});




}
/// @nodoc
class __$AppRouteCopyWithImpl<$Res>
    implements _$AppRouteCopyWith<$Res> {
  __$AppRouteCopyWithImpl(this._self, this._then);

  final _AppRoute _self;
  final $Res Function(_AppRoute) _then;

/// Create a copy of AppRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? label = null,Object? icon = null,Object? child = null,}) {
  return _then(_AppRoute(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}


}

// dart format on
