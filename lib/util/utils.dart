import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/api/wrapper.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Uh-oh, er gings iets mis."),
          Builder(
            builder: (context) {
              if (kDebugMode) {
                ApiException? e;
                if (error.runtimeType == ApiException) {
                  e = error as ApiException;
                }

                return Card(
                  color: Theme.of(context).errorColor.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(error.toString(), style: Theme.of(context).textTheme.subtitle1),
                        e != null ? const Divider() : Container(),
                        e != null ? Text(e.statusCode.toString()) : Container(),
                        e != null ? Text(e.message) : Container()
                      ],
                    ),
                  ),
                );
              }

              return Container();
            },
          )
        ],
      ),
    );
  }

  static Widget noResults() {
    return const Center(
      child: Text("Geen resultaten gevonden."),
    );
  }
}
