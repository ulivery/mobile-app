import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/login/login.dart';
import 'package:ulivery_mobile_app/pages/onboarding.dart';
import 'package:ulivery_mobile_app/pages/shop_environments.dart';
import 'package:ulivery_mobile_app/util/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UliveryApp());
}

class UliveryApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const UliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ulivery',
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Builder(
        builder: (context) {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              // User? user = FirebaseAuth.instance.currentUser;
              // if (user!= null && !user.emailVerified) {
              //   await user.sendEmailVerification();
              // } TODO: Implement email verification check

              navigatorKey.currentState!.pushAndRemoveUntil(_animatedRoute(const LoginPage()), (route) => false);
            } else {
              navigatorKey.currentState!
                  .pushAndRemoveUntil(_animatedRoute(const ShopEnvironmentsPage()), (route) => false);
            }
          });

          return const OnBoardingScreen();
        },
      ),
    );
  }

  Route _animatedRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(curve: Curves.linear, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
