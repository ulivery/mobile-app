import 'package:flutter/material.dart';

class BackgroundRegisterpage extends StatelessWidget {
  final Widget child;
  const BackgroundRegisterpage({
    Key? key,
    required this.child,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/LoginPages/signup_top.png',
                width: screenWidth * 0.4,
              )
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/LoginPages/login_bottom.png',
                width: screenWidth * 0.3,
              )
          ),
          child,
        ],
      ),
    );
  }
}