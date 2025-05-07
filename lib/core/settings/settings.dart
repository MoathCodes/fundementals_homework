import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

enum TriState { idle, active, inactive }

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required bool allowPayment,
    required List<String> slots,
    required int selectedSlot,
    required TriState isUrgent,
    required bool isLoggedIn,
    required bool isUMLMode,
    required bool isBooked,
    required bool isPaymentPage,
  }) = _Settings;
}
