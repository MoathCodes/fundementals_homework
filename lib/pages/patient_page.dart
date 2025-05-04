import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/widget/single_slot_selection.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class PatientPage extends ConsumerWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsEditor = ref.read(settingsNotifierProvider.notifier);
    final settings = ref.watch(settingsNotifierProvider);
    return Scaffold(
      headers: [
        AppBar(
          title: const Text("HeartFlow Hospital App"),
          subtitle: Text("Appointment System"),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(24),
          Switch(
            leading: Text("Is this an urgent situation?"),
            value: settings.isUrgent,
            enabled: settings.slots.isNotEmpty,
            onChanged:
                (value) =>
                    settingsEditor
                      ..setIsUrgent(value)
                      ..selectNearestSlot(),
          ),
          if (settings.slots.isEmpty) ...[
            Text(
              "No Slots Available",
              style: Typography.geist().base.copyWith(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ],
          Gap(24),
          Text("Select Appointment Time").h4,
          Gap(12),
          settings.isUrgent
              ? Alert.destructive(
                title: Text("Urgent Situation Protocol"),
                content: Column(
                  children: [
                    Text(
                      "Since this is an Urgent Situation, we automaticlly selected the nearest time",
                    ),
                    Text(
                      "Your Apointment time is: ${settings.slots[settings.selectedSlot]}",
                    ).bold,
                  ],
                ),
              )
              : SingleSlotSelection(),
          Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Department:").bold.small,
              DropdownMenu(
                children: [MenuLabel(child: Text("General Doctor"))],
              ),
            ],
          ),
          Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Available Doctor:").bold.small,
              DropdownMenu(
                children: [
                  MenuLabel(
                    leading: Icon(BootstrapIcons.hospital),
                    child: Text("Dr. Khaled Kashmeri"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
