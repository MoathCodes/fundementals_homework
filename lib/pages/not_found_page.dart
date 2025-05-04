import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing:  10,
      children: [
        Text("How did you get here? GO BACK!").h2(),
        PrimaryButton(
          child: Text("GO BACK!"),
          onPressed: () => GoRouter.of(context).go('/patient'),
        ),
      ],
    );
  }
}
