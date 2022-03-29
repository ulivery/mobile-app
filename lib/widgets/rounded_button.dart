import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double width;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = const Color.fromRGBO(6, 50, 58, 1),
    this.textColor = Colors.white,
    this.width = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.5),
      width: screenWidth * width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minimumSize: const Size(50, 30),
              alignment: Alignment.center,
              backgroundColor: color),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
