import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute genericGoToRoute({
  required String routeName,
  required Widget Function(Object? extra) routeScreenBuilder, // function to handle extra
  Object? extra, // Optional parameter to pass extra data
}) {
  return GoRoute(
    path: routeName,
    name: routeName,
    builder: (context, state) {
      //TODO: Need to research on better approach for below implementation.

      return routeScreenBuilder(state.extra);
    },
    // pageBuilder: (context, state) {
    //   return customPageTransition(
    //     child: DebugOverlayView(
    //       allowDebugging: FlavorConfig.allowDebugging,
    //       navigatorKey: coreRouter.navigatorKey,
    //       child: routeScreenBuilder(state.extra), // Pass the extra to the screen
    //     ),
    //     state: state,
    //   );
    // },
  );
}
