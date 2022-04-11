import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/main.dart';
import 'package:ulivery_mobile_app/pages/base.dart';

class OrderPage extends BasicPage {
  const OrderPage({Key? key}) : super(title: "Mijn bestelling", key: key);

  @override
  BasicPageState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BasicPageState<OrderPage> {
  static String location = '';

  static Route<void> _modalBuilderDeliveryTime(
    BuildContext context,
    dynamic arguments,
  ) {
    List<String> times = [];
    times.add('Zo snel mogelijk');

    int startTime = 9;
    int endTime = 17;
    int slotsInHour = 4;

    int passedMinutes = 60 ~/ slotsInHour;
    int minutes = passedMinutes;

    while (startTime != endTime) {
      times.add(startTime.toString().padLeft(2, '0') +
          ':' +
          0.toString().padLeft(2, '0'));
      while (passedMinutes < 60) {
        times.add(startTime.toString().padLeft(2, '0') +
            ':' +
            passedMinutes.toString().padLeft(2, '0'));
        passedMinutes += minutes;
      }
      passedMinutes = minutes;
      startTime++;
    }
    times.add(startTime.toString().padLeft(2, '0') +
        ':' +
        0.toString().padLeft(2, '0'));

    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: CupertinoPicker(
            itemExtent: 30,
            onSelectedItemChanged: (index) {
              location = times[index];
            },
            backgroundColor: Colors.white,
            scrollController: FixedExtentScrollController(initialItem: 0),
            children: times
                .map((item) => Center(
                      child: Text(
                        item,
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }

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
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Voor- en achternaam'),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Locatie'),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Ruimtenummer'),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Voeg een opmerking toe voor de bezorger'),
              CupertinoTextField(
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                placeholder: 'bijv. blauwe bank bij de docentenkamer',
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Bezorgtijd'),
              CupertinoTextField(
                controller: TextEditingController(text: location),
                keyboardType: TextInputType.none,
                enabled: true,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .restorablePush(_modalBuilderDeliveryTime);
                  setState(() {});
                },
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Tijd om de bestelling te accepteren'),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          CupertinoButton.filled(
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            child: const Text('Bestel en betaal (€ 0.00)'),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => const OrderPage()));
            },
          )
        ],
      ),
    );
  }
}
