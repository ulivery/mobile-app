import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/text_field_container.dart';

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
