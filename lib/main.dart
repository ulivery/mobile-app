import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_startpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/Colors.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/body_startpage.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_startpage.dart';
import 'package:ulivery_mobile_app/pages/shop_environments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ulivery Log-in',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: colorprimary,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const StartPage());
  }
}

