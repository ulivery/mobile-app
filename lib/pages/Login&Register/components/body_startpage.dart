import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/background_startpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_loginpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_registerpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/RoundedButton.dart';

import '../../Login&Register/components/Colors.dart';



class BodyStartpage extends StatelessWidget{
  const BodyStartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return BackgroundStartscreen(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Image.asset('assets/LoginPages/logo.png',
          width: screenWidth * 0.9,
          ),
          SizedBox(
              height: screenHeight * 0.5
          ),
          RoundedButton(
            text: "Inloggen",
            color: colorprimary,
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
            color: colorprimarylight,
            textColor: colorprimary,
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
