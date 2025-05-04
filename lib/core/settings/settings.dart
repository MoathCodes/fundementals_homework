import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required bool allowPayment,
    required List<String> slots,
    required int selectedSlot,
    required bool isUrgent,
    required bool isLoggedIn,
  }) = _Settings;
}