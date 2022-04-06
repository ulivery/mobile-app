import 'package:flutter/cupertino.dart';
import 'package:ulivery_mobile_app/pages/login/login.dart';
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
              icon: Icon(CupertinoIcons.house),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.doc_text),
              activeIcon: Icon(CupertinoIcons.doc_text_fill),
              label: 'Bestellingen'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag),
              activeIcon: Icon(CupertinoIcons.bag_fill),
              label: 'Winkelmand'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis),
              activeIcon: Icon(CupertinoIcons.person_fill),
              label: 'Meer'),
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
