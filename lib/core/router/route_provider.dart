// ignore_for_file: avoid_build_context_in_providers
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/router/route.dart';
import 'package:fundementals_homework/pages/doctor_page.dart';
import 'package:fundementals_homework/pages/not_found_page.dart';
import 'package:fundementals_homework/pages/patient_container/patient_page_container.dart';
import 'package:fundementals_homework/widget/shell_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

part 'route_provider.g.dart';

// Also keep the router alive to prevent initialization issues
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  // Access the routes provider
  final routes = ref.read(routesProvider);

  return GoRouter(
    routes: _generateRoutes(routes),
    initialLocation: '/doctor',
    errorBuilder: (context, state) => NotFoundPage(),
  );
}

// Make this provider keep alive to ensure it's initialized early
@Riverpod(keepAlive: true)
List<AppRoute> routes(Ref ref) {
  return [
    AppRoute(
      path: '/doctor',
      label: 'Doctor',
      icon: BootstrapIcons.book,
      child: const DoctorPage(),
    ),
    AppRoute(
      path: '/patient',
      label: 'Patient',
      icon: BootstrapIcons.clock,
      child: const PatientPageContainer(),
    ),
  ];
}

/// Builds a custom transition page
CustomTransitionPage<void> _buildCustomTransitionPage(
  LocalKey key,
  Widget child,
) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    barrierDismissible: true,
    barrierColor: Colors.white.withValues(alpha: 0.2),
    opaque: false,
    transitionDuration: const Duration(milliseconds: 550),
    reverseTransitionDuration: const Duration(milliseconds: 360),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

// Helper functions moved outside of the provider
List<RouteBase> _generateRoutes(List<AppRoute> routes) {
  return [
    ShellRoute(
      builder: (context, state, child) {
        return ShellWidget(child: child);
      },
      routes:
          routes
              .map(
                (route) => GoRoute(
                  path: route.path,
                  name: route.label,
                  pageBuilder:
                      (context, state) => _buildCustomTransitionPage(
                        state.pageKey,
                        route.child,
                      ),
                ),
              )
              .toList(),
    ),
  ];
}
