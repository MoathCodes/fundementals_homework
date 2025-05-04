import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/widget/slot_selection.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

final times = [
  '12:00 AM - 1:00 AM',
  '1:00 AM - 2:00 AM',
  '2:00 AM - 3:00 AM',
  '3:00 AM - 4:00 AM',
  '4:00 AM - 5:00 AM',
  '5:00 AM - 6:00 AM',
  '6:00 AM - 7:00 AM',
  '7:00 AM - 8:00 AM',
  '8:00 AM - 9:00 AM',
  '9:00 AM - 10:00 AM',
  '10:00 AM - 11:00 AM',
  '11:00 AM - 12:00 PM',
  '12:00 PM - 1:00 PM',
  '1:00 PM - 2:00 PM',
  '2:00 PM - 3:00 PM',
  '3:00 PM - 4:00 PM',
  '4:00 PM - 5:00 PM',
  '5:00 PM - 6:00 PM',
  '6:00 PM - 7:00 PM',
  '7:00 PM - 8:00 PM',
];

class DoctorPage extends ConsumerWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    return Scaffold(
      child: OutlinedContainer(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Switch(
              leading: Text("Allow Payment:").h3,
              value: settings.allowPayment,
              onChanged: (value) {
                ref
                    .watch(settingsNotifierProvider.notifier)
                    .setAllowPayment(value);
              },
            ),
            
                SlotSelection(slots: times),
          ],
        ),
      ),
    );
  }
}
