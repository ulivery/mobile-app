import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/login/verify_email.dart';
import 'package:ulivery_mobile_app/pages/onboarding.dart';
import 'package:ulivery_mobile_app/pages/select_service.dart';
import 'package:ulivery_mobile_app/pages/product_environment.dart';
import 'package:ulivery_mobile_app/pages/wallet/payment_screen.dart';
import 'package:ulivery_mobile_app/pages/wallet/top_up.dart';
import 'package:ulivery_mobile_app/pages/wallet/wallet_overview.dart';
import 'package:ulivery_mobile_app/util/theme.dart';
import 'package:ulivery_mobile_app/util/utils.dart';

import 'api/catalog.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(UliveryApp());
}

class UliveryApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static late final Catalog catalog;

  UliveryApp({Key? key}) : super(key: key) {
    catalog = Catalog();
  }

  static void fadeHome() {
    navigatorKey.currentState!.pushAndRemoveUntil(fadeRoute(const SelectService()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ulivery',
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Builder(
        builder: (context) {
          return PaymentScreen();
          FirebaseAuth.instance.authStateChanges().listen((User? user) async {
            if (user == null) {
              navigatorKey.currentState!.pushAndRemoveUntil(fadeRoute(const OnBoardingScreen()), (route) => false);
            } else {
              // Email verification check
              if (!user.emailVerified) {
                await user.sendEmailVerification();
                navigatorKey.currentState!.pushAndRemoveUntil(
                    fadeRoute(const VerifyEmailPage(), duration: const Duration(milliseconds: 0)), (route) => false);
                return;
              }
              
              fadeHome();
            }
          });

          if (FirebaseAuth.instance.currentUser == null) {
            return const OnBoardingScreen();
          }

          return const Scaffold();
        },
      ),
    );
  }
}
