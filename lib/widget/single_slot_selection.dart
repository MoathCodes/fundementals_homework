import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/widget/slot_selection.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SingleSlotSelection extends ConsumerStatefulWidget {
  const SingleSlotSelection({super.key});

  @override
  ConsumerState<SingleSlotSelection> createState() =>
      _SingleSlotSelectionState();
}

class _SingleSlotSelectionState extends ConsumerState<SingleSlotSelection> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsNotifierProvider);
    return OutlinedContainer(
      width: 700,
      height: 200,
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 5,
          runSpacing: 5,
          children: [
            ...settings.slots.asMap().entries.map(
              (e) => CardSlot(
                textStyle: TextStyle(fontSize: 12),
                onChanged: (isSelected) {
                  if (isSelected) {
                    ref
                        .read(settingsNotifierProvider.notifier)
                        .setSelectedSlot(e.key);
                  }
                },
                isSelected: e.key == settings.selectedSlot,
                value: e.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
