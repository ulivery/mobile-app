import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Deliveries/complete_order.dart';
import 'package:ulivery_mobile_app/pages/deliveries/accept_deliveries_page.dart';
import 'package:ulivery_mobile_app/pages/deliveries/accept_order.dart';

class DeliveriesOverviewPage extends StatefulWidget {
  const DeliveriesOverviewPage({Key? key}) : super(key: key);

  @override
  State<DeliveriesOverviewPage> createState() => _DeliveriesOverviewPageState();
}

class _DeliveriesOverviewPageState extends State<DeliveriesOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geaccepteerde bestelling"),
      ),
      body: DeliveriesOverviewPageBody(),
    );
  }
}

class DeliveriesOverviewPageBody extends StatefulWidget {
  const DeliveriesOverviewPageBody({Key? key}) : super(key: key);

  @override
  State<DeliveriesOverviewPageBody> createState() => _DeliveriesOverviewPageBodyState();
}

class _DeliveriesOverviewPageBodyState extends State<DeliveriesOverviewPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          OrderCard(acceptatietijd: '9 min', ordernummer: '#897', bezorgtijd: '30 min', icon: Icons.check_circle_outline, iconcolor: Theme.of(context).colorScheme.primary, press: () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DeliverOrder()));  },),
          OrderCard(ordernummer: '#898', acceptatietijd: "12 min", bezorgtijd: "30 min", icon: Icons.check_circle_rounded, iconcolor: Colors.green, press: () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DeliverOrder()));  },)
        ],
      ),
    );
  }
}
