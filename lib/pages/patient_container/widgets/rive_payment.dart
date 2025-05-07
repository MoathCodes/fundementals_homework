import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

part 'rive_payment.g.dart';

@riverpod
class RivePaymentNotifier extends _$RivePaymentNotifier {
  @override
  double build() {
    // Watch settings provider to automatically rebuild when settings change
    // final settings = ref.watch(settingsNotifierProvider);

    // Convert boolean values to double (0.0 or 1.0) for Rive
    return 0;
  }

  void setValue(double value) {
    state = value;
  }
}

class RivePaymentWidget extends ConsumerStatefulWidget {
  const RivePaymentWidget({super.key});

  @override
  ConsumerState<RivePaymentWidget> createState() => _RiveDashboardWidgetState();
}

class _RiveDashboardWidgetState extends ConsumerState<RivePaymentWidget> {
  StateMachineController? _controller;
  SMIInput<double>? _state;

  @override
  Widget build(BuildContext context) {
    // Watch the dashboard provider (which watches settings)
    final dashboard = ref.watch(rivePaymentNotifierProvider);

    // Update Rive inputs whenever dashboard values change
    if (_state != null) {
      _state!.value = dashboard;
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
            artboard: 'Payment',
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
    _state = controller.findInput<double>('yes');

    if (_state == null) {
      print('Failed to find input: slot');
    }

    // Use setState to ensure the widget rebuilds after controller is initialized
    setState(() {
      // Set initial values from the dashboard state
      final dashboard = ref.read(rivePaymentNotifierProvider);
      if (_state != null) {
        _state!.value = dashboard;
      }
    });
  }
}
