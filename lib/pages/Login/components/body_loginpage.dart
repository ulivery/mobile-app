import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login/components/background_loginpage.dart';
import 'package:ulivery_mobile_app/pages/Login/components/background_startpage.dart';
import 'package:ulivery_mobile_app/pages/Login/widgets/rounded_input_field.dart';
import 'package:ulivery_mobile_app/pages/Login/pages/login_loginpage.dart';

import 'Colors.dart';
import '../widgets/RoundedButton.dart';


class BodyLoginpage extends StatelessWidget{
  const BodyLoginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return BackgroundLoginpage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Inloggen",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/LoginPages/logo.png",
          width: screenWidth * 0.9),
          RoundedInputField(
            hintText: "E-mailadres",
            onChanged: (value) {},
          ),
        ],
      )
    );

  }
}





