// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hasanat/core/routing/route.dart';
// import 'package:hasanat/core/routing/route_provider.dart';
// import 'package:hasanat/core/widgets/navigation_shell.dart';
// import 'package:hasanat/core/widgets/not_found_page.dart';
// import 'package:hasanat/generated/l10n.dart';
// import 'package:shadcn_flutter/shadcn_flutter.dart';

// class AppRouter {
//   final GoRouter router;

//   AppRouter(WidgetRef ref, S s)
//       : router = GoRouter(
//           routes: _generateRoutes(ref.read(routesProvider(s))),
//           initialLocation: ref.read(routesProvider(s))[0].path,
//           errorPageBuilder: (context, state) => CustomTransitionPage<void>(
//             key: state.pageKey,
//             child: NotFoundPage(
//                 errorMsg: state.error?.message ??
//                     "we couldn't find this page please make sure you enterd the correct url."),
//             barrierDismissible: true,
//             barrierColor: Colors.white.withValues(alpha: 0.38),
//             opaque: false,
//             transitionDuration: const Duration(milliseconds: 550),
//             reverseTransitionDuration: const Duration(milliseconds: 360),
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return FadeTransition(
//                 opacity: animation,
//                 child: child,
//               );
//             },
//           ),
//         );

//   static List<RouteBase> _generateRoutes(List<AppRoute> routes) => [
//         ShellRoute(
//           routes: routes
//               .map(
//                 (route) => GoRoute(
//                   path: route.path,
//                   name: route.label,
//                   pageBuilder: (context, state) {
//                     return CustomTransitionPage<void>(
//                       key: state.pageKey,
//                       child: route.child,
//                       barrierDismissible: true,
//                       barrierColor: Colors.black.withValues(alpha: 0.38),
//                       opaque: false,
//                       transitionDuration: const Duration(milliseconds: 550),
//                       reverseTransitionDuration:
//                           const Duration(milliseconds: 360),
//                       transitionsBuilder: (BuildContext context,
//                           Animation<double> animation,
//                           Animation<double> secondaryAnimation,
//                           Widget child) {
//                         return FadeTransition(
//                           opacity: animation,
//                           child: child,
//                         );
//                       },
//                     );
//                   },
//                 ),
//               )
//               .toList(),

//           // This part is for the navigation bar, it uses a widget called
//           // ShellScaffold to create the navbar, then pass the current route
//           // to it as a child in order to display that route with the navbar.
//           pageBuilder: (context, state, child) => CustomTransitionPage<void>(
//             key: state.pageKey,
//             child: NavigationShell(
//               routes: routes,
//               child: child,
//             ),
//             barrierDismissible: true,
//             barrierColor: Colors.white.withValues(alpha: 0.38),
//             opaque: false,
//             transitionDuration: const Duration(milliseconds: 550),
//             reverseTransitionDuration: const Duration(milliseconds: 360),
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return FadeTransition(
//                 opacity: animation,
//                 child: child,
//               );
//             },
//           ),
//         ),
//       ];
// }
