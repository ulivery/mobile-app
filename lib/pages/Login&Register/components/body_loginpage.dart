import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/background_loginpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_registerpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/RoundedButton.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/have_account_check.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/rounded_input_field.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/rounded_password_field.dart';

import '../../Login&Register/components/Colors.dart';



class BodyLoginpage extends StatelessWidget{
  const BodyLoginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return BackgroundLoginpage(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Inloggen",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/LoginPages/logo.png",
            width: screenWidth * 0.9),
            SizedBox(
              height: screenHeight * 0.35,
            ),
            RoundedInputField(
              hintText: "E-mailadres",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value){},
            ),
            RoundedButton(
                text: "Inloggen",
                press: (){},
              color: colorprimary,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            HaveAccountCheck(
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
      )
    );

  }
}

