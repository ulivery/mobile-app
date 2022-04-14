import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Deliveries/complete_order.dart';
import 'package:ulivery_mobile_app/pages/QRCode.dart';
import 'package:ulivery_mobile_app/pages/qr_code_scanner.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';

class CustomerOrderDetailPage extends StatelessWidget {
  const CustomerOrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order #002"),
      ),
      body: CustomerOrderDetailPageBody()
    );
  }
}

class CustomerOrderDetailPageBody extends StatefulWidget {
  const CustomerOrderDetailPageBody({Key? key}) : super(key: key);

  @override
  State<CustomerOrderDetailPageBody> createState() => _CustomerOrderDetailPageBodyState();
}

class _CustomerOrderDetailPageBodyState extends State<CustomerOrderDetailPageBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Bestelling",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                ProductCard(
                  screenWidth: screenWidth,
                  producttitle: 'Pompoen',
                  subtitle: '€5,10\nGegrilde aubergine en chimichurri',
                  productcount: '2',
                  image: 'assets/img/pumpkin.png',
                ),
                ProductCard(
                    screenWidth: screenWidth,
                    image: 'assets/img/pumpkin.png',
                    producttitle: 'Pompoen',
                    subtitle: '€5,10\nGegrilde aubergine en chimichurri',
                    productcount: '1'),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Totaal: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "€12,34",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              "Klantgegevens",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                DeliveryInfoField(screenWidth: screenWidth,
                    label: 'Voor- en achternaam',
                    text: 'Jan Janssen'),
                DeliveryInfoField(
                  screenWidth: screenWidth,
                  label: 'Locatie',
                  text: 'Heerlen - Nieuw Eyckholt',
                ),
                DeliveryInfoField(screenWidth: screenWidth,
                    label: 'Ruimtenummer / plaats',
                    text: 'B.2.203'),
                DeliveryInfoField(screenWidth: screenWidth,
                    label: 'Bezorgtijd',
                    text: 'Zo snel mogelijk'),
                DeliveryInfoField(screenWidth: screenWidth,
                    label: 'Opmerkingen',
                    text: 'Geen')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Center(
                  child: RoundedButton(
                      text: 'QR-code voor ontvangst',
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const QRCode()));
                      }))),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}