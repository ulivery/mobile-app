import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/components/account_check.dart';
import 'package:ulivery_mobile_app/components/login_background.dart';
import 'package:ulivery_mobile_app/pages/login/login.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';
import 'package:ulivery_mobile_app/widgets/rounded_input_field.dart';
import 'package:ulivery_mobile_app/widgets/rounded_password_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterPageBody(),
    );
  }
}

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({Key? key}) : super(key: key);

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LoginBackground(
      topAsset: 'assets/img/login/signup_top.png',
      bottomAsset: 'assets/img/login/login_bottom.png',
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Registreren",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/img/logo.png",
              width: screenWidth * 0.9,
            ),
            RoundedInputField(
              hintText: "Voornaam",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Achternaam",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "E-mailadres",
              onChanged: (value) {},
            ),
            RoundedPasswordField(onChanged: (value) {}),
            RoundedButton(
              text: "Registreren",
              press: () {},
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            HasAccountCheck(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              login: false,
            )
          ],
        ),
      ),
    );
  }
}
