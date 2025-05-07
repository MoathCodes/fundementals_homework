import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

part 'rive_login.g.dart';

@riverpod
class RiveLogin extends _$RiveLogin {
  @override
  int build() {
    return 0;
  }

  void setValue(int value) {
    state = value;
  }
}

class RiveLoginWidget extends ConsumerStatefulWidget {
  const RiveLoginWidget({super.key});

  @override
  ConsumerState<RiveLoginWidget> createState() => _RiveLoginWidgetState();
}

class _RiveLoginWidgetState extends ConsumerState<RiveLoginWidget> {
  StateMachineController? _controller;
  SMIInput<double>? _loginStateInput;

  @override
  Widget build(BuildContext context) {
    // 1) Listen for changes here, at the top of build
    ref.listen<int>(riveLoginProvider, (previous, next) {
      if (_loginStateInput != null) {
        _loginStateInput!.value = next.toDouble();
      }
    });

    // 2) Build your Rive animation as before
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("UML Overview").h2,
        SizedBox(
          height: 400,
          width: 400,
          child: RiveAnimation.asset(
            'Animation.riv',
            artboard: 'Login',
            stateMachines: const ['State Machine 1'],
            onInit: _onRiveInit,
            key: const ValueKey('rive-login-animation'),
          ),
        ),
      ],
    );
  }

  void _onRiveInit(Artboard artboard) {
    if (_controller == null) {
      final controller = StateMachineController.fromArtboard(
        artboard,
        'State Machine 1',
      );
      if (controller != null) {
        artboard.addController(controller);
        _controller = controller;
        _loginStateInput = controller.findInput<double>('login_state');
        // initialize to current provider value
        final current = ref.read(riveLoginProvider);
        _loginStateInput!.value = current.toDouble();
      }
    }
  }
}
