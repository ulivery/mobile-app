import 'package:flutter/material.dart';

class AcceptDeliveriesPage extends StatefulWidget {
  const AcceptDeliveriesPage({Key? key}) : super(key: key);

  @override
  State<AcceptDeliveriesPage> createState() => _AcceptDeliveriesPageState();
}

class _AcceptDeliveriesPageState extends State<AcceptDeliveriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bestellingsoverzicht"),
      ),
      body: AcceptDeliveriesPageBody(),
    );
  }
}

class AcceptDeliveriesPageBody extends StatefulWidget {
  const AcceptDeliveriesPageBody({Key? key}) : super(key: key);

  @override
  State<AcceptDeliveriesPageBody> createState() => _AcceptDeliveriesPageBodyState();
}

class _AcceptDeliveriesPageBodyState extends State<AcceptDeliveriesPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          OrderCard(acceptatietijd: '9 min', ordernummer: '#897', bezorgtijd: '30 min', icon: Icons.check_circle_outline, iconcolor: Theme.of(context).colorScheme.primary,),
          OrderCard(ordernummer: '#898', acceptatietijd: "12 min", bezorgtijd: "30 min", icon: Icons.check_circle_rounded, iconcolor: Colors.green,)
        ],
      ) ,);
  }
}

class OrderCard extends StatelessWidget {
  final String ordernummer;
  final String acceptatietijd;
  final String bezorgtijd;
  final IconData icon;
  final Color iconcolor;
  const OrderCard({
    Key? key, required this.ordernummer, required this.acceptatietijd, required this.bezorgtijd, required this.icon, required this.iconcolor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(ordernummer),],),
        title: Text("Acceptatietijd: $acceptatietijd."),
        subtitle: Text("Bezorgtijd: $bezorgtijd."),
        trailing: Icon(icon, size: 50, color: iconcolor,),
      ),
    );
  }
}
