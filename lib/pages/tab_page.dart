import 'package:flutter/cupertino.dart';
<<<<<<< Updated upstream
import 'package:ulivery_mobile_app/pages/login/login.dart';
=======
import 'package:ulivery_mobile_app/main.dart';
>>>>>>> Stashed changes
import 'package:ulivery_mobile_app/pages/product_environment.dart';

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
<<<<<<< Updated upstream
              icon: Icon(CupertinoIcons.house),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: 'Home'),
=======
              icon: Icon(UliveryApp.homeIcon), label: 'Home'),
>>>>>>> Stashed changes
          BottomNavigationBarItem(
              icon: Icon(UliveryApp.orderIcon), label: 'Bestellingen'),
          BottomNavigationBarItem(
<<<<<<< Updated upstream
              icon: Icon(CupertinoIcons.bag),
              activeIcon: Icon(CupertinoIcons.bag_fill),
              label: 'Winkelmand'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis),
              activeIcon: Icon(CupertinoIcons.person_fill),
              label: 'Meer'),
=======
              icon: Icon(UliveryApp.walletIcon), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(UliveryApp.settingsIcon), label: 'Instellingen'),
>>>>>>> Stashed changes
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const ProductEnvironmentPage();
              case 1:
                return const LoginPage();
              case 2:
                return const LoginPage();
              case 3:
                return const LoginPage();
            }
            return const CupertinoApp();
          },
        );
      },
    );
  }
}
