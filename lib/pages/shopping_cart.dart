import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/main.dart';
import 'package:ulivery_mobile_app/pages/base.dart';
import 'package:ulivery_mobile_app/pages/order.dart';

class ShoppingCartPage extends BasicPage {
  const ShoppingCartPage({Key? key})
      : super(title: "Mijn bestelling", key: key);

  @override
  BasicPageState<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends BasicPageState<ShoppingCartPage> {
  @override
  Widget buildBody(BuildContext context) {
    // Creates a map where product is the key and quantity is the value.
    var shoppingCartProducts = {};
    for (var product in UliveryApp.shoppingCartProducts) {
      if (!shoppingCartProducts.containsKey(product)) {
        shoppingCartProducts[product] = 1;
      } else {
        shoppingCartProducts[product] += 1;
      }
    }

    double shippingPrice = 1.0;
    double productsPrice = 0.0;

    for (var product in UliveryApp.shoppingCartProducts) {
      productsPrice += product.price;
    }

    double shoppingCartPrice = shippingPrice + productsPrice;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: shoppingCartProducts.isEmpty
          ? const Center(
              child: Text(
                'Er zijn nog geen producten toegevoegd aan het winkelmandje.',
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: shoppingCartProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product key = shoppingCartProducts.keys.elementAt(index);
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8.0)),
                                          image: DecorationImage(
                                            image: NetworkImage(key.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              key.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text('€ ' +
                                                (key.price *
                                                        shoppingCartProducts[
                                                            key])
                                                    .toStringAsFixed(2)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                UliveryApp.shoppingCartProducts
                                                    .remove(key);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 50,
                                                child: shoppingCartProducts[
                                                            key] ==
                                                        1
                                                    ? const Icon(
                                                        CupertinoIcons
                                                            .trash_circle_fill,
                                                        size: 40,
                                                        color: Color.fromRGBO(
                                                            6, 50, 58, 1),
                                                      )
                                                    : const Icon(
                                                        CupertinoIcons
                                                            .minus_circle_fill,
                                                        size: 40,
                                                        color: Color.fromRGBO(
                                                            6, 50, 58, 1),
                                                      ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    const Icon(
                                                      CupertinoIcons.circle,
                                                      size: 40,
                                                      color: Color.fromRGBO(
                                                          6, 50, 58, 1),
                                                    ),
                                                    Text(
                                                      shoppingCartProducts[key]
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Color.fromRGBO(
                                                            6, 50, 58, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                UliveryApp.shoppingCartProducts
                                                    .add(key);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 50,
                                                child: const Icon(
                                                  CupertinoIcons
                                                      .add_circled_solid,
                                                  size: 40,
                                                  color: Color.fromRGBO(
                                                      6, 50, 58, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(65, 0, 0, 0),
                                  child: Divider(
                                    height: 20.0,
                                    color: Color.fromRGBO(205, 205, 205, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Subtotaal'),
                              Text('Bezorgkosten'),
                              Text(
                                'Totaal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('€ ' + productsPrice.toStringAsFixed(2)),
                              Text('€ ' + shippingPrice.toStringAsFixed(2)),
                              Text(
                                '€ ' + shoppingCartPrice.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CupertinoButton.filled(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0)),
                        child: const Text('Bestellen'),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (_) => const OrderPage()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
