import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? type;

  const RoundedInputField(
      {Key? key, required this.hintText, this.icon = Icons.person, required this.controller, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) return "Vul hier iets in.";
          return null;
        },
        keyboardType: type,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
