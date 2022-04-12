import 'package:firebase_auth/firebase_auth.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _error;
  bool _isLoading = false;

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
              _error == null
                  ? Container()
                  : Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedInputField(
                      icon: Icons.mail,
                      type: TextInputType.emailAddress,
                      hintText: "E-mailadres",
                      controller: _email,
                    ),
                    RoundedPasswordField(
                      controller: _password,
                    ),
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
                      text: "Inloggen",
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _error = null;
                            _isLoading = true;
                          });

                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-disabled') {
                              setState(() {
                                _error = "Je account is momenteel geblokkeerd";
                              });
                            } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                              setState(() {
                                _error = "Ongeldige log-in gegevens";
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
