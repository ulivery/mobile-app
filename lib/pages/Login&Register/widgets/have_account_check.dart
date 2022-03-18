

import 'package:flutter/material.dart';

import '../../Login&Register/components/Colors.dart';



class HaveAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const HaveAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ?"Nog geen account? ": "Nog geen account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registreren": "Registreren",
            style: TextStyle(
                color: colorprimary, fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}






