import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ulivery_mobile_app/pages/Login/components/body_startpage.dart';

class StartPage extends StatelessWidget{
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyStartpage());
  }

}