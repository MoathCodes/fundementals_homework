import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/pages/patient_container/models/rive_dashboard.dart';
import 'package:rive/rive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

part 'rive_dashboard.g.dart';

@riverpod
class RiveDashboardNotifier extends _$RiveDashboardNotifier {
  @override
  RiveDashboard build() {
    // Watch settings provider to automatically rebuild when settings change
    final settings = ref.watch(settingsNotifierProvider);

    // Convert boolean values to double (0.0 or 1.0) for Rive
    return RiveDashboard(
      isSlotAvailable: settings.slots.isNotEmpty ? 1.0 : -1.0,
      isUrgent: switch (settings.isUrgent) {
        TriState.idle => settings.selectedSlot >= 0 ? -1 : 0,
        TriState.active => 1,
        TriState.inactive => -1,
      },
    );
  }
}

class RiveDashboardWidget extends ConsumerStatefulWidget {
  const RiveDashboardWidget({super.key});

  @override
  ConsumerState<RiveDashboardWidget> createState() =>
      _RiveDashboardWidgetState();
}

class _RiveDashboardWidgetState extends ConsumerState<RiveDashboardWidget> {
  StateMachineController? _controller;
  SMIInput<double>? _slot;
  SMIInput<double>? _urgent;

  @override
  Widget build(BuildContext context) {
    // Watch the dashboard provider (which watches settings)
    final dashboard = ref.watch(riveDashboardNotifierProvider);

    // Update Rive inputs whenever dashboard values change
    if (_slot != null) {
      _slot!.value = dashboard.isSlotAvailable;
    }

    if (_urgent != null) {
      _urgent!.value = dashboard.isUrgent;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("UML Overview").h2,
        OutlinedContainer(
          height: 400,
          width: 400,
          child: RiveAnimation.asset(
            'assets/Animation.riv',
            artboard: 'Dashboard',
            stateMachines: const ['State Machine 1'],
            onInit: _onRiveInit,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onRiveInit(Artboard artboard) {
    // Create a new controller if one doesn't exist
    final controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );

    if (controller == null) {
      print('Failed to create controller from artboard');
      return;
    }

    // Add the controller to the artboard
    artboard.addController(controller);
    _controller = controller;

    // Find the inputs
    _slot = controller.findInput<double>('slot');
    _urgent = controller.findInput<double>('urgent');

    if (_slot == null) {
      print('Failed to find input: slot');
    }

    if (_urgent == null) {
      print('Failed to find input: urgent');
    }

    // Use setState to ensure the widget rebuilds after controller is initialized
    setState(() {
      // Set initial values from the dashboard state
      final dashboard = ref.read(riveDashboardNotifierProvider);
      if (_slot != null) {
        _slot!.value = dashboard.isSlotAvailable;
      }

      if (_urgent != null) {
        _urgent!.value = dashboard.isUrgent;
      }
    });
  }
}
