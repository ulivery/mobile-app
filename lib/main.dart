import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/onboarding.dart';

import 'firebase_options.dart';
import 'util/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UliveryApp());
}

class UliveryApp extends StatelessWidget {
  const UliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        //TODO: Redirect user to login
      } else {
        //TODO: Redirect user to home
      }
    });

    return MaterialApp(
      title: 'Ulivery',
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
