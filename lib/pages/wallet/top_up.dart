import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/wallet/payment_screen_modal.dart';

class TopUp extends StatelessWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opwaarderen"),
      ),
      body: TopUpBody(),
    );
  }
}

class TopUpBody extends StatelessWidget {
  const TopUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: Text("Betalen met je eigen tegoed is snel, veilig en eenvoudig. Stort nu een bedrag naar keuze en je kunt het meteen gebruiken om een bestelling te plaatsen. Klik op een van onderstaande knoppen om te beginnen.", style: TextStyle(fontSize: 18),),
                  ),
                ),
            ),
            Expanded(
              flex: 5,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                                onPressed: (){showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context){
                                    return FractionallySizedBox(
                                      heightFactor: 0.9,
                                      child: PaymentScreenModal(),
                                    );
                                  },
                                );},
                                child: const Text(
                                  "€ 5",
                                  style: TextStyle(fontSize: 20),
                                ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: (){showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context){
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: PaymentScreenModal(),
                                  );
                                },
                              );},
                              child: const Text(
                                "€ 10",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: (){showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context){
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: PaymentScreenModal(),
                                  );
                                },
                              );},
                              child: const Text(
                                "€ 15",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: (){showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context){
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: PaymentScreenModal(),
                                  );
                                },
                              );},
                              child: const Text(
                                "€ 20",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: (){showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context){
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: PaymentScreenModal(),
                                  );
                                },
                              );},
                              child: const Text(
                                "€ 25",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: (){showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context){
                                  return FractionallySizedBox(
                                    heightFactor: 0.9,
                                    child: PaymentScreenModal(),
                                  );
                                },
                              );},
                              child: const Text(
                                "€ 30",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ),
          ],
        ),
    );
  }
}
