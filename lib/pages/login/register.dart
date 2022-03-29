import 'package:firebase_auth/firebase_auth.dart';
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
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _error;

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
            _error == null ? Container() : Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    hintText: "Voornaam",
                    controller: _firstName,
                    type: TextInputType.name,
                  ),
                  RoundedInputField(
                    hintText: "Achternaam",
                    controller: _lastName,
                    type: TextInputType.name,
                  ),
                  RoundedInputField(
                    hintText: "E-mailadres",
                    controller: _email,
                    type: TextInputType.emailAddress,
                  ),
                  RoundedPasswordField(controller: _password),
                ],
              ),
            ),
            _isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                    child: LinearProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                        minHeight: 5,
                        backgroundColor: Colors.transparent),
                  )
                : RoundedButton(
                    text: "Registreren",
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _error = null;
                          _isLoading = true;
                        });

                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(email: _email.text, password: _password.text);

                          User? user = FirebaseAuth.instance.currentUser;
                          if (user != null) {
                            user.updateDisplayName(_firstName.text + " " + _lastName.text);
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            setState(() {
                              _error = "Wachtwoord is niet sterk genoeg.";
                            });
                          } else if (e.code == 'email-already-in-use') {
                            setState(() {
                              _error = "E-mailadres al in gebruik.";
                            });
                          } else {
                            setState(() {
                              _error = e.code;
                            });
                          }
                        }

                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
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
