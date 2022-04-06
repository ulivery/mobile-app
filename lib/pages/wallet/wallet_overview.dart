import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';

class WalletOverview extends StatelessWidget {
  const WalletOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("Tegoed")
      ),
      body: const WalletBody(),
    );
  }
}

class WalletBody extends StatefulWidget {
  const WalletBody({Key? key}) : super(key: key);

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: screenWidth,
                      child: Container(
                        width: screenWidth * 0.55,
                        height: screenWidth * 0.55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 4.0
                          )
                        ),
                        child: Center(
                          child: Text("€2,34", style: TextStyle(fontSize: 35)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    RoundedButton(text: "Tegoed opwaarderen", press: (){}, color: Theme.of(context).colorScheme.secondary, textColor: Theme.of(context).colorScheme.primary,)
                  ],
                ),
            ),
            Expanded(
              flex: 5,
                child: Container(
                  width: screenWidth * 0.9,
                  child: ListView(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.payment),
                          title: Text("Bestelling #821"),
                          trailing: Text("-€8,21"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.euro),
                          title: Text("Tegoed opgewaardeerd"),
                          trailing: Text("+€20,00"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.payment),
                          title: Text("Bestelling #821"),
                          trailing: Text("-€8,21"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.euro),
                          title: Text("Tegoed opgewaardeerd"),
                          trailing: Text("+€20,00"),
                        ),
                      ),

                    ],

                  ),
                ))
          ],
        ),
    );
  }
}

