import 'package:flutter/material.dart';

class HasAccountCheck extends StatelessWidget {
  final bool login;
  final Function() onPress;

  const HasAccountCheck({this.login = true, required this.onPress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Nog geen account? " : "Nog geen account? ",
          style: const TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            login ? "Registreren" : "Registreren",
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
