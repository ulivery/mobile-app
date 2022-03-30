import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {


  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  bool _isObscure = true;
  Widget build(BuildContext context) {

    return TextFieldContainer(
      child: TextFormField(
        obscureText: _isObscure,
        controller: widget.controller,
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
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off
            ),

            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
