

import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/shop_environments.dart';
import 'package:ulivery_mobile_app/util/theme.dart';

class SelectService extends StatelessWidget {
  const SelectService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ServicePageBody(),
    );
  }
}

class ServicePageBody extends StatelessWidget {
  const ServicePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ServiceButton(screenHeight: screenHeight, image: 'assets/img/services/eten_bestellen.png', text: 'Ik wil eten bestellen', pressed:() {Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ShopEnvironmentsPage()));},),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ServiceButton(screenHeight: screenHeight, text: "Ik wil eten bezorgen", image: "assets/img/services/eten_bezorgen.png", pressed: () {},)
          ],
        ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final VoidCallback pressed;
  final String text;
  final String image;
  const ServiceButton({
    Key? key,
    required this.screenHeight, required this.text, required this.image, required this.pressed,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary)),
            onPressed: pressed,
            child: Row(
              children: <Widget>[
                 Expanded(
                  flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(text, style: TextStyle(fontSize: 33, color: Theme.of(context).colorScheme.primary), textAlign: TextAlign.center,),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Icon(Icons.play_circle, size: 40, color: Theme.of(context).colorScheme.primary,)

                      ],
                    )
                ),
                Expanded(
                  flex: 7,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Image.asset(image)),
                    )
                )
              ],
            ),
        ),
      ),
    );
  }
}
