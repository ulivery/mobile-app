import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';

class PaymentScreenModal extends StatelessWidget {
  const PaymentScreenModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tegoed opwaarderen"),
      ),
      body: PaymentScreenBody(),
    );
  }
}

class PaymentScreenBody extends StatefulWidget {
  const PaymentScreenBody({Key? key}) : super(key: key);

  @override
  State<PaymentScreenBody> createState() => _PaymentScreenBodyState();
}

class _PaymentScreenBodyState extends State<PaymentScreenBody> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(7),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(2)
                    },
                    children: [
                      TableRow(
                        children: [
                          Text("Huidig tegoed:", style: TextStyle(fontSize: 20),),
                          Text("€ ", style: TextStyle(fontSize: 20),),
                          Text("5,23", style: TextStyle(fontSize: 20), textAlign: TextAlign.right,),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("Opwaarderen:", style: TextStyle(fontSize: 20),),
                          Text("€ ", style: TextStyle(fontSize: 20),),
                          Text("10,00", style: TextStyle(fontSize: 20),textAlign: TextAlign.right,),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("Transactiekosten:", style: TextStyle(fontSize: 20),),
                          Text("€ ", style: TextStyle(fontSize: 20),),
                          Text("0,25", style: TextStyle(fontSize: 20),textAlign: TextAlign.right,),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text("Nieuw tegoed:", style: TextStyle(fontSize: 20),),
                          Text("€ ", style: TextStyle(fontSize: 20),),
                          Text("15,23", style: TextStyle(fontSize: 20),textAlign: TextAlign.right,),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1
                            )

                          )
                        ),
                        children: [
                          Text("Te betalen:", style: TextStyle(fontSize: 20),),
                          Text("€ ", style: TextStyle(fontSize: 20),),
                          Text("10,25", style: TextStyle(fontSize: 20),textAlign: TextAlign.right,),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/img/payments/ideal.png"),
                          title: Text("Betalen met", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("iDEAL - Rabobank"),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 1,
                child: Column(
                  children: <Widget>[
                    RoundedButton(text: "Opwaarderen", press: (){}),
                    RoundedButton(text: "Annuleren", press: (){Navigator.pop(context);}, color: Theme.of(context).colorScheme.secondary, textColor: Theme.of(context).colorScheme.primary,),
                  ],

            ),
            ),
          ],
        ),
    );
  }
}

