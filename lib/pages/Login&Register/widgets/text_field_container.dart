import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: screenWidth * 0.7,
      decoration: BoxDecoration(
        color: colorprimarylight,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}