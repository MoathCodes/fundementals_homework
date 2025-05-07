import 'package:fundementals_homework/core/settings/settings.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

int getEarliestSlot(List<String> slots) {
  final today = DateTime.now();
  final fmt = DateFormat('h:mm a');

  DateTime slotStart(String slot) {
    // Parse “8:00 AM” from “8:00 AM - 9:00 AM”
    final raw = slot.split(' - ').first;
    final t = fmt.parse(raw);
    // Build a DateTime on today’s date
    return DateTime(today.year, today.month, today.day, t.hour, t.minute);
  }

  // Pick the slot whose start DateTime is the min
  return slots.indexWhere(
    (element) =>
        element ==
        slots.reduce((a, b) {
          return slotStart(a).isBefore(slotStart(b)) ? a : b;
        }),
  );
}

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  void addSingleSlot(String slot) {
    state = state.copyWith(slots: [...state.slots, slot]);
  }

  @override
  Settings build() {
    return Settings(
      allowPayment: true,
      isUrgent: TriState.idle,
      slots: [],
      selectedSlot: -1,
      isLoggedIn: false,
      isUMLMode: true,
      isBooked: false,
      isPaymentPage: false,
    );
  }

  void removeSingleSlot(String slot) {
    final newSlots = [...state.slots];
    newSlots.remove(slot);
    state = state.copyWith(slots: newSlots);
  }

  void selectNearestSlot() {
    state = state.copyWith(selectedSlot: getEarliestSlot(state.slots));
  }

  void setAllowPayment(bool value) {
    state = state.copyWith(allowPayment: value);
  }

  void setIsBooked(bool value) {
    state = state.copyWith(isBooked: value);
  }

  void setIsLoggedIn(bool value) {
    state = state.copyWith(isLoggedIn: value);
  }

  void setIsPaymentPage(bool value) {
    state = state.copyWith(isPaymentPage: value);
  }

  void setIsUrgent(bool value, {bool reset = false}) {
    if (reset) {
      state = state.copyWith(isUrgent: TriState.idle);
    } else {
      state = state.copyWith(
        isUrgent: value ? TriState.active : TriState.inactive,
      );
    }
  }

  void setSelectedSlot(int value) {
    state = state.copyWith(selectedSlot: value);
  }

  void setSlots(List<String> slots) {
    state = state.copyWith(slots: slots);
  }

  void setUMLMode(bool value) {
    state = state.copyWith(isUMLMode: value);
  }
}
