import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/widgets/text_field_container.dart';

import '../components/Colors.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Wachtwoord",
          icon: Icon(Icons.lock,
            color: colorprimary,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: colorprimary,
          ),
          border: InputBorder.none,

        ) ,
      ),
    );
  }
}
