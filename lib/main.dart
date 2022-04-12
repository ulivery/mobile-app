import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/api/wallet.dart';
import 'package:ulivery_mobile_app/pages/deliveries/accept_deliveries_page.dart';
import 'package:ulivery_mobile_app/pages/login/verify_email.dart';
import 'package:ulivery_mobile_app/pages/onboarding.dart';
import 'package:ulivery_mobile_app/pages/select_service.dart';
import 'package:ulivery_mobile_app/util/theme.dart';
import 'package:ulivery_mobile_app/util/utils.dart';

import 'api/catalog.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UliveryApp());
}

class UliveryApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final Catalog catalog = Catalog();
  static final Wallet wallet = Wallet();
  static List<Product> shoppingCartProducts = [];

  const UliveryApp({Key? key}) : super(key: key);

  static void fadeHome() {
    navigatorKey.currentState!
        .pushAndRemoveUntil(fadeRoute(const SelectService()), (route) => false);
  }

  static const _kFontFam = 'UliveryAppIcons';
  static const String? _kFontPkg = null;
  static const IconData settingsIcon =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData homeIcon =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData orderIcon =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData shoppingCartIcon =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData walletIcon =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ulivery',
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Builder(
        builder: (context) {
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
