import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CardSlot extends StatelessWidget {
  final void Function(bool isSelected) onChanged;
  final bool isSelected;
  final String value;
  final TextStyle? textStyle;

  const CardSlot({
    required this.onChanged,
    super.key,
    required this.isSelected,
    required this.value,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onChanged(!isSelected);
        },
        child: Card(
          borderColor:
              isSelected ? Theme.of(context).colorScheme.primary : null,
          child:
              textStyle != null
                  ? Text(value, style: textStyle)
                  : Text(value).small,
        ),
      ),
    );
  }
}

class SlotSelection extends ConsumerStatefulWidget {
  final List<String> slots;
  const SlotSelection({super.key, required this.slots});

  @override
  ConsumerState<SlotSelection> createState() => _SlotSelectionState();
}

class _SlotSelectionState extends ConsumerState<SlotSelection> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsNotifierProvider);
    final settingsEditor = ref.read(settingsNotifierProvider.notifier);
    return OutlinedContainer(
      width: 700,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Text("Select Available Time Slot").h2,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SecondaryButton(
                child: Text("Unselect All"),
                onPressed: () {
                  settingsEditor.setSlots([]);
                },
              ),
              Button.primary(
                child: Text("Select All"),
                onPressed: () {
                  settingsEditor.setSlots(widget.slots);
                },
              ),
            ],
          ),
          SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 5,
              runSpacing: 5,
              children: [
                ...widget.slots.asMap().entries.map(
                  (e) => CardSlot(
                    onChanged: (isSelected) {
                      isSelected
                          ? settingsEditor.addSingleSlot(e.value)
                          : settingsEditor.removeSingleSlot(e.value);
                    },
                    isSelected: settings.slots.contains(e.value),
                    value: e.value,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            leading: Text("Allow Payment:").h3,
            value: settings.allowPayment,
            onChanged: (value) {
              ref
                  .watch(settingsNotifierProvider.notifier)
                  .setAllowPayment(value);
            },
          ),
        ],
      ),
    );
  }
}
