import 'package:flutter/material.dart';

Route fadeRoute(Widget page, {Duration? duration}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: duration ?? const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(curve: Curves.linear, parent: animation);
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class FutureUtils {
  static Widget loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget error(Object? error) {
    return const Center(
      child: Text("Uh-oh, er gings iets mis."),
    );
  }

  static Widget noResults() {
    return const Center(
      child: Text("Geen resultaten gevonden."),
    );
  }
}
