import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) return "Vul hier iets in.";
          return null;
        },
        decoration: InputDecoration(
          hintText: "Wachtwoord",
          icon: Icon(
            Icons.lock,
            color: Theme.of(context).colorScheme.primary,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Theme.of(context).colorScheme.primary,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
