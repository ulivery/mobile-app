import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/shop_environments.dart';

import 'util/theme.dart';

void main() {
  runApp(const UliveryApp());
}

class UliveryApp extends StatelessWidget {
  const UliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ulivery',
      theme: defaultTheme,
      home: const ShopEnvironmentsPage(),
    );
  }
}
