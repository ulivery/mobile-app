import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/components/login_background.dart';
import 'package:ulivery_mobile_app/pages/login/login.dart';
import 'package:ulivery_mobile_app/pages/login/register.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';

class LoginStartPage extends StatelessWidget {
  const LoginStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginStartPageBody());
  }
}

class LoginStartPageBody extends StatelessWidget {
  const LoginStartPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/logo.png',
              width: screenWidth * 0.9,
            ),
            SizedBox(height: screenHeight * 0.5),
            RoundedButton(
              text: "Inloggen",
              color: Theme.of(context).colorScheme.primary,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Registreren",
              color: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.primary,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
