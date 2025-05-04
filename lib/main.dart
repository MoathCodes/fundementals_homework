import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/router/route_provider.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouterProvider);
    return ShadcnApp.router(
      title: 'HeartFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorSchemes.lightZinc(), radius: 0.5),
      routerConfig: router,
    );
  }
}
