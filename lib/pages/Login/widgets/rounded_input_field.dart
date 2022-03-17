import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login/components/Colors.dart';
import 'package:ulivery_mobile_app/pages/Login/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(icon, color: colorprimary,),
            hintText: hintText,
            border: InputBorder.none
        ),
      ),
    );
  }
}