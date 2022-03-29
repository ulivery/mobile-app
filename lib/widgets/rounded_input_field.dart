import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
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
