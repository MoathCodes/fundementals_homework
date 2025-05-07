// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Settings {

 bool get allowPayment; List<String> get slots; int get selectedSlot; TriState get isUrgent; bool get isLoggedIn; bool get isUMLMode; bool get isBooked; bool get isPaymentPage;
/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsCopyWith<Settings> get copyWith => _$SettingsCopyWithImpl<Settings>(this as Settings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Settings&&(identical(other.allowPayment, allowPayment) || other.allowPayment == allowPayment)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.selectedSlot, selectedSlot) || other.selectedSlot == selectedSlot)&&(identical(other.isUrgent, isUrgent) || other.isUrgent == isUrgent)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.isUMLMode, isUMLMode) || other.isUMLMode == isUMLMode)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.isPaymentPage, isPaymentPage) || other.isPaymentPage == isPaymentPage));
}


@override
int get hashCode => Object.hash(runtimeType,allowPayment,const DeepCollectionEquality().hash(slots),selectedSlot,isUrgent,isLoggedIn,isUMLMode,isBooked,isPaymentPage);

@override
String toString() {
  return 'Settings(allowPayment: $allowPayment, slots: $slots, selectedSlot: $selectedSlot, isUrgent: $isUrgent, isLoggedIn: $isLoggedIn, isUMLMode: $isUMLMode, isBooked: $isBooked, isPaymentPage: $isPaymentPage)';
}


}

/// @nodoc
abstract mixin class $SettingsCopyWith<$Res>  {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) _then) = _$SettingsCopyWithImpl;
@useResult
$Res call({
 bool allowPayment, List<String> slots, int selectedSlot, TriState isUrgent, bool isLoggedIn, bool isUMLMode, bool isBooked, bool isPaymentPage
});




}
/// @nodoc
class _$SettingsCopyWithImpl<$Res>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._self, this._then);

  final Settings _self;
  final $Res Function(Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowPayment = null,Object? slots = null,Object? selectedSlot = null,Object? isUrgent = null,Object? isLoggedIn = null,Object? isUMLMode = null,Object? isBooked = null,Object? isPaymentPage = null,}) {
  return _then(_self.copyWith(
allowPayment: null == allowPayment ? _self.allowPayment : allowPayment // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<String>,selectedSlot: null == selectedSlot ? _self.selectedSlot : selectedSlot // ignore: cast_nullable_to_non_nullable
as int,isUrgent: null == isUrgent ? _self.isUrgent : isUrgent // ignore: cast_nullable_to_non_nullable
as TriState,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,isUMLMode: null == isUMLMode ? _self.isUMLMode : isUMLMode // ignore: cast_nullable_to_non_nullable
as bool,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,isPaymentPage: null == isPaymentPage ? _self.isPaymentPage : isPaymentPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _Settings implements Settings {
  const _Settings({required this.allowPayment, required final  List<String> slots, required this.selectedSlot, required this.isUrgent, required this.isLoggedIn, required this.isUMLMode, required this.isBooked, required this.isPaymentPage}): _slots = slots;
  

@override final  bool allowPayment;
 final  List<String> _slots;
@override List<String> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override final  int selectedSlot;
@override final  TriState isUrgent;
@override final  bool isLoggedIn;
@override final  bool isUMLMode;
@override final  bool isBooked;
@override final  bool isPaymentPage;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsCopyWith<_Settings> get copyWith => __$SettingsCopyWithImpl<_Settings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Settings&&(identical(other.allowPayment, allowPayment) || other.allowPayment == allowPayment)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.selectedSlot, selectedSlot) || other.selectedSlot == selectedSlot)&&(identical(other.isUrgent, isUrgent) || other.isUrgent == isUrgent)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.isUMLMode, isUMLMode) || other.isUMLMode == isUMLMode)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.isPaymentPage, isPaymentPage) || other.isPaymentPage == isPaymentPage));
}


@override
int get hashCode => Object.hash(runtimeType,allowPayment,const DeepCollectionEquality().hash(_slots),selectedSlot,isUrgent,isLoggedIn,isUMLMode,isBooked,isPaymentPage);

@override
String toString() {
  return 'Settings(allowPayment: $allowPayment, slots: $slots, selectedSlot: $selectedSlot, isUrgent: $isUrgent, isLoggedIn: $isLoggedIn, isUMLMode: $isUMLMode, isBooked: $isBooked, isPaymentPage: $isPaymentPage)';
}


}

/// @nodoc
abstract mixin class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) _then) = __$SettingsCopyWithImpl;
@override @useResult
$Res call({
 bool allowPayment, List<String> slots, int selectedSlot, TriState isUrgent, bool isLoggedIn, bool isUMLMode, bool isBooked, bool isPaymentPage
});




}
/// @nodoc
class __$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(this._self, this._then);

  final _Settings _self;
  final $Res Function(_Settings) _then;

/// Create a copy of Settings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowPayment = null,Object? slots = null,Object? selectedSlot = null,Object? isUrgent = null,Object? isLoggedIn = null,Object? isUMLMode = null,Object? isBooked = null,Object? isPaymentPage = null,}) {
  return _then(_Settings(
allowPayment: null == allowPayment ? _self.allowPayment : allowPayment // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<String>,selectedSlot: null == selectedSlot ? _self.selectedSlot : selectedSlot // ignore: cast_nullable_to_non_nullable
as int,isUrgent: null == isUrgent ? _self.isUrgent : isUrgent // ignore: cast_nullable_to_non_nullable
as TriState,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,isUMLMode: null == isUMLMode ? _self.isUMLMode : isUMLMode // ignore: cast_nullable_to_non_nullable
as bool,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,isPaymentPage: null == isPaymentPage ? _self.isPaymentPage : isPaymentPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
