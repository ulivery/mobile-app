import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/customer_order_details.dart';
import 'package:ulivery_mobile_app/pages/deliveries/accept_deliveries_page.dart';

class CustomerOrders extends StatefulWidget {
  const CustomerOrders({Key? key}) : super(key: key);

  @override
  State<CustomerOrders> createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mijn bestellingen"),
      ),
      body: const CustomerOrdersBody(),
    );
  }
}

class CustomerOrdersBody extends StatefulWidget {
  const CustomerOrdersBody({Key? key}) : super(key: key);

  @override
  State<CustomerOrdersBody> createState() => _CustomerOrdersBodyState();
}

class _CustomerOrdersBodyState extends State<CustomerOrdersBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: <Widget>[
            OrderCard(ordernummer: "002", acceptatietijd: "12 min", bezorgtijd: "29 min", icon: Icons.check_circle_outlined, iconcolor: Theme.of(context).colorScheme.primary, press: (){Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CustomerOrderDetailPage()));}),
          ],
        ),
    );
  }
}
