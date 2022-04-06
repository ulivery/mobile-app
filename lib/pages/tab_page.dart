import 'package:flutter/cupertino.dart';
import 'package:ulivery_mobile_app/pages/product_environment.dart';
import 'package:ulivery_mobile_app/pages/wallet/wallet_overview.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house), activeIcon: Icon(CupertinoIcons.house_fill), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.doc_text),
              activeIcon: Icon(CupertinoIcons.doc_text_fill),
              label: 'Bestellingen'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_euro_circle),
              activeIcon: Icon(CupertinoIcons.money_euro_circle_fill),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gear), activeIcon: Icon(CupertinoIcons.gear_alt_fill), label: 'Instellingen'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const ProductEnvironmentPage();
              case 1:
                return Container();
              case 2:
                return const WalletOverview();
              case 3:
                return Container();
            }
            return const CupertinoApp();
          },
        );
      },
    );
  }
}
