import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/Colors.dart';
import 'package:ulivery_mobile_app/pages/Onboarding/components/body_onboarding_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body_Onboarding_Screen(),
    );
  }
}
