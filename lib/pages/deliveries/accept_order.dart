import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';

class DeliverOrderOverview extends StatefulWidget {
  const DeliverOrderOverview({Key? key}) : super(key: key);

  @override
  State<DeliverOrderOverview> createState() => _DeliverOrderOverviewState();
}

class _DeliverOrderOverviewState extends State<DeliverOrderOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#897"),
      ),
      body: DeliverOrderOverviewBody(),
    );
  }
}

class DeliverOrderOverviewBody extends StatefulWidget {
  const DeliverOrderOverviewBody({Key? key}) : super(key: key);

  @override
  State<DeliverOrderOverviewBody> createState() => _DeliverOrderOverviewBodyState();
}

class _DeliverOrderOverviewBodyState extends State<DeliverOrderOverviewBody> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                DeliveryInfoField(
                  screenWidth: screenWidth,
                  label: 'Locatie',
                  text: 'Heerlen - Nieuw Eyckholt',
                ),
                DeliveryInfoField(screenWidth: screenWidth, label: 'Ruimtenummer / plaats', text: 'B.2.203'),
                DeliveryInfoField(screenWidth: screenWidth, label: 'Bezorgtijd', text: 'Zo snel mogelijk'),
                DeliveryInfoField(screenWidth: screenWidth, label: 'Opmerkingen', text: 'Geen')
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Center(
                  child: RoundedButton(
            text: 'Accepteren',
            press: () {},
            color: Theme.of(context).colorScheme.secondary,
            textColor: Theme.of(context).colorScheme.primary,
          )))
        ],
      ),
    );
  }
}

class DeliveryInfoField extends StatelessWidget {
  final String label;
  final String text;
  const DeliveryInfoField({
    Key? key,
    required this.screenWidth,
    required this.label,
    required this.text,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label),
          Container(
            width: screenWidth * 0.8,
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(fillColor: Theme.of(context).colorScheme.secondary, hintText: text),
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String producttitle;
  final String subtitle;
  final String productcount;

  const ProductCard({
    Key? key,
    required this.screenWidth,
    required this.image,
    required this.producttitle,
    required this.subtitle,
    required this.productcount,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(image),
        title: Text(producttitle),
        subtitle: Text(subtitle),
        trailing: Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2.0)),
          child: Center(
            child: Text(productcount),
          ),
        ),
      ),
    );
  }
}
