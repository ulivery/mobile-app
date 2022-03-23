import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/Colors.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/background_registerpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_loginpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/RoundedButton.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/have_account_check.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/rounded_input_field.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/rounded_password_field.dart';

class Body_Registerpage extends StatelessWidget {
  const Body_Registerpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return BackgroundRegisterpage(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Registreren",
              style: TextStyle(fontWeight: FontWeight.bold
              ),
              ),
              Image.asset("assets/LoginPages/logo.png",
              width: screenWidth * 0.9,
              ),
              RoundedInputField(
                  hintText: "Voornaam",
                  onChanged: (value){},
              ),
              RoundedInputField(
                hintText: "Achternaam",
                onChanged: (value){},
              ),
              RoundedInputField(
                hintText: "E-mailadres",
                onChanged: (value){},
              ),
              RoundedPasswordField(
                  onChanged: (value) {}
              ),
              RoundedButton(
                  text: "Registreren",
                  press: (){},
              color: colorprimary,
              ),
              SizedBox(
                height: screenHeight * 0.035,
              ),
              HaveAccountCheck(
                press: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                      (context){
                        return const LoginPage();
                      },
                      ),
                  );
                },
                login: false,)
            ],
          ),
        ),
    );
  }
}