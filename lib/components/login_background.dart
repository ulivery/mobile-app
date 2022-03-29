import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  final String topAsset;
  final String bottomAsset;

  const LoginBackground(
      {required this.child,
      this.topAsset = 'assets/img/login/main_top.png',
      this.bottomAsset = 'assets/img/login/main_bottom.png',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topAsset,
                width: screenWidth * 0.4,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                bottomAsset,
                width: screenWidth * 0.3,
              )),
          child,
        ],
      ),
    );
  }
}
