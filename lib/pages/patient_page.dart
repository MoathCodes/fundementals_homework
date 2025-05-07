import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundementals_homework/core/settings/settings.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/pages/patient_container/widgets/rive_payment.dart';
import 'package:fundementals_homework/widget/single_slot_selection.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Dashboard extends StatelessWidget {
  final Settings settings;
  final RivePaymentNotifier rivePaymentNotifier;
  final SettingsNotifier settingsEditor;
  const Dashboard({
    super.key,
    required this.settings,
    required this.settingsEditor,
    required this.rivePaymentNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Gap(24),
        Switch(
          leading: Text("Is this an urgent situation?"),
          value: settings.isUrgent == TriState.active,
          enabled: settings.slots.isNotEmpty,
          onChanged: (value) {
            settingsEditor
              ..setIsUrgent(value)
              ..selectNearestSlot();
          },
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
        settings.isUrgent == TriState.active
            ? Alert.destructive(
              title: Text("Urgent Situation Protocol"),
              content: Column(
                children: [
                  Text(
                    "Since this is an Urgent Situation, we automatically selected the nearest time",
                  ),
                  Text(
                    "Your Appointment time is: ${settings.slots[settings.selectedSlot]}",
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
            DropdownMenu(children: [MenuLabel(child: Text("General Doctor"))]),
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
                  child: Text("Dr. Khalid Kashmiri"),
                ),
              ],
            ),
          ],
        ),
        Gap(24),
        if (settings.selectedSlot >= 0) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Before 15% VAT:").bold.xSmall,
              Row(
                children: [
                  Text(
                    (69.420 - (69.420 * 0.130434783)).toStringAsFixed(2),
                  ).xSmall.muted,
                  SvgPicture.asset(
                    r'assets/Saudi_Riyal_Symbol.svg',
                    color: Colors.gray.shade400,
                    height: 16,
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("15% VAT:").muted.xSmall,
              Row(
                children: [
                  Text((69.420 * 0.130434783).toStringAsFixed(2)).xSmall.muted,
                  SvgPicture.asset(
                    r'assets/Saudi_Riyal_Symbol.svg',
                    color: Colors.gray.shade400,

                    height: 16,
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:").bold,
              Row(
                children: [
                  Text('${69.420}', style: TextStyle(color: Colors.green)),
                  SvgPicture.asset(
                    r'assets/Saudi_Riyal_Symbol.svg',
                    color: Colors.green,

                    height: 16,
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
        Gap(24),
        Text(
          "ⓘ Your card information is saved and secured.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ).xSmall,
        PrimaryButton(
          onPressed: () {
            settingsEditor.setIsPaymentPage(true);
            if (settings.allowPayment) {
              settingsEditor.setIsBooked(true);
              rivePaymentNotifier.setValue(1);
              showToast(
                context: context,
                location: ToastLocation.bottomCenter,
                builder: (context, overlay) {
                  return SurfaceCard(
                    child: Basic(
                      title: Text("Your Appointment was booked Successfully"),
                      subtitle: Text(
                        "Please be there at ${settings.slots[settings.selectedSlot]}",
                      ),
                      trailing: IconButton.secondary(
                        icon: Icon(BootstrapIcons.x),
                        onPressed: () {
                          overlay.close();
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              rivePaymentNotifier.setValue(-1);
              showToast(
                context: context,
                location: ToastLocation.bottomCenter,
                builder: (context, overlay) {
                  return SurfaceCard(
                    child: Basic(
                      leading: Icon(
                        BootstrapIcons.infoCircle,
                        color: Colors.red,
                        size: 32,
                      ),
                      title: Text(
                        "Payment Failed",
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text(
                        "Please check your payment information and try again.",
                      ),
                      trailing: IconButton.secondary(
                        icon: Icon(BootstrapIcons.x),
                        onPressed: () {
                          overlay.close();
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
          enabled: settings.selectedSlot >= 0,
          leading: Icon(BootstrapIcons.paypal),
          alignment: Alignment.center,
          child: Text("Book Appointment"),
        ),
      ],
    );
  }
}

class PatientPage extends ConsumerWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsEditor = ref.read(settingsNotifierProvider.notifier);
    final settings = ref.watch(settingsNotifierProvider);

    final rivePaymentEditor = ref.watch(rivePaymentNotifierProvider.notifier);
    return Scaffold(
      headers: [
        AppBar(
          title: const Text("HeartFlow Hospital App"),
          subtitle: Text("Appointment System"),
        ),
      ],
      child:
          settings.isBooked
              ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Alert(
                    title: Text(
                      'Payment Successful',
                      style: TextStyle(color: Colors.green),
                    ),
                    leading: Icon(
                      BootstrapIcons.infoCircle,
                      size: 32,
                      color: Colors.green,
                    ),
                    content: Text(
                      "Your appoint was booked successfully please be at the hospital at ${settings.slots[settings.selectedSlot]}",
                    ),
                  ),
                  PrimaryButton(
                    child: Text("Reset"),
                    onPressed: () {
                      settingsEditor
                        ..setIsLoggedIn(false)
                        ..setIsUrgent(false, reset: true)
                        ..setSelectedSlot(-1)
                        ..setIsBooked(false)
                        ..setIsPaymentPage(false);

                      rivePaymentEditor.setValue(0);
                    },
                  ),
                ],
              )
              : Dashboard(
                rivePaymentNotifier: rivePaymentEditor,
                settings: settings,
                settingsEditor: settingsEditor,
              ),
    );
  }
}
