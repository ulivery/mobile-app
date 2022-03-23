import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/body_loginpage.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyLoginpage());
  }

}