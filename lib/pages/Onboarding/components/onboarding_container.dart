import 'package:flutter/material.dart';

import '../../Login&Register/components/Colors.dart';

class OnboardingContainer extends StatelessWidget {
  const OnboardingContainer({
    Key? key,
    this.titletext,
    this.text,
    this.image,
  }) : super(key: key);

  final String? titletext;
  final String? text;
  final String? image;


  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          width: screenWidth,
          height: screenHeight * 0.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image!)
              )
          ),
        ),

        SizedBox(
          height: screenHeight * 0.06,
        ),
        SizedBox(
          width: screenWidth * 0.8,
          child: Text(titletext!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: colorprimary
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),

        SizedBox(
          width: screenWidth * 0.8,
          child: Text(text!,
            style: const TextStyle(

                fontSize: 15,
                color: colorprimary
            ),
            textAlign: TextAlign.center,
          ),
        ),

      ],
    );
  }
}
