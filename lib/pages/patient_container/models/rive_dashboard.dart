import 'package:freezed_annotation/freezed_annotation.dart';

part 'rive_dashboard.freezed.dart';

@freezed
abstract class RiveDashboard with _$RiveDashboard {
  const factory RiveDashboard({
    required double isUrgent,
    required double isSlotAvailable,
  }) = _RiveDashboard;
}
