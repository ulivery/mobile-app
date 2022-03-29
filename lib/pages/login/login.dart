import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/components/account_check.dart';
import 'package:ulivery_mobile_app/components/login_background.dart';
import 'package:ulivery_mobile_app/pages/login/register.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';
import 'package:ulivery_mobile_app/widgets/rounded_input_field.dart';
import 'package:ulivery_mobile_app/widgets/rounded_password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPageBody(),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LoginBackground(
        bottomAsset: 'assets/img/login/login_bottom.png',
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Inloggen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/img/logo.png", width: screenWidth * 0.9),
              SizedBox(
                height: screenHeight * 0.35,
              ),
              RoundedInputField(
                hintText: "E-mailadres",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "Inloggen",
                press: () {},
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              HasAccountCheck(
                onPress: () {
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
        ));
  }
}
