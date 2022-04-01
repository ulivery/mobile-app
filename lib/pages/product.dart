import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/model.dart';
import 'package:ulivery_mobile_app/pages/base.dart';

class ProductPage extends BasicPage {
  const ProductPage({required ProductEnvironment productEnvironment, required String title, Key? key})
      : super(title: title, key: key);

  @override
  BasicPageState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BasicPageState<ProductPage> {
  static Route<void> _modalBuilder(
    BuildContext context,
    Object? arguments,
  ) {
    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: CupertinoPicker(
            itemExtent: 30,
            onSelectedItemChanged: null,
            backgroundColor: Colors.white,
            scrollController: FixedExtentScrollController(initialItem: 1),
            children: [
              Text(arguments.toString()),
            ],
          ),
        );
      },
    );
  }

  static Route<void> _modalBuilder2(BuildContext context, Object? arguments) {
    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return Dismissible(
          direction: DismissDirection.down,
          key: const Key('key'),
          onDismissed: (_) => Navigator.of(context).pop(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 50,
            child: Scaffold(
              body: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Image.asset('assets/ProductPage/ProductTempeh.png', fit: BoxFit.cover),
                            ),
                            ClipRRect(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/ProductPage/ProductTypeVegan.png',
                                              width: 50.0,
                                              height: 50.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/ProductPage/ProductTypeVegan.png',
                                              width: 50.0,
                                              height: 50.0,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: const [
                          Text(
                            'Volkoren sandwich',
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 30.0),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                              'Een verantwoorde, veganistische sandwiche van 2 sneeën vegan volkorenbrood met daarop gegrilde aubergine, little gem sla, granaatappelpitjes en chimichurri (een mix van rode peper, knoflook, tomaat, rode ui, dille, zeezout, basilicum en dragon).',
                              overflow: TextOverflow.clip),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          const Text(
                            'Voedingswaarden',
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 30.0),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('energie'),
                                  Text('natrium'),
                                  Text('eiwit'),
                                  Text('zout'),
                                  Text('vezels')
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [Text('0'), Text('0'), Text('0'), Text('0'), Text('0')],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('koolhydraten'),
                                  Text('waarvan suikers'),
                                  Text('vet'),
                                  Text('waarvan verzadigd')
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [Text('0'), Text('0'), Text('0'), Text('0')],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),
                        CupertinoButton.filled(
                            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                            child: const Text('Voeg toe aan bestelling'),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        CupertinoButton(
                            child: const Text('Kijk verder'),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static List<ProductCategory> productCategories = [];

  static List<Product> products = [
    Product(
      id: 1,
      name: 'Auberginekoekjes',
      image: 'ProductAuberginekoekjes.png',
      price: 2.55,
      category: productCategories[0],
      shortDescription: 'Aubergine met sesamzaadjes en lijnzaad',
      longDescription: 'Aubergine met sesamzaadjes en lijnzaad',
    ),
    Product(
      id: 2,
      name: 'Bospeen',
      image: 'ProductBospeen.png',
      price: 2.55,
      category: productCategories[0],
      shortDescription: 'Bospeen met limoen en amandel',
      longDescription: 'Bospeen met limoen en amandel',
    ),
    Product(
      id: 3,
      name: 'Pompoen',
      image: 'ProductPompoen.png',
      price: 2.55,
      category: productCategories[0],
      shortDescription: 'Pompoen met feta en rode peper',
      longDescription: 'Pompoen met feta en rode peper',
    ),
    Product(
      id: 4,
      name: 'Tempeh',
      image: 'ProductTempeh.png',
      price: 2.55,
      category: productCategories[0],
      shortDescription: 'Broccoli met granaatappelpitjes',
      longDescription: 'Broccoli met granaatappelpitjes',
    ),
    Product(
      id: 5,
      name: 'Tosti',
      image: 'ProductTempeh.png',
      price: 2.55,
      category: productCategories[1],
      shortDescription: '',
      longDescription: '',
    ),
  ];

  static List<ProductCategory> categorystest = [];

  static List<Product> productstest = [];

  static List<ProductOption> productOptions = [
    ProductOption(name: 'Kaas', product: products[4]),
    ProductOption(name: 'Ham', product: products[4]),
    ProductOption(name: 'Ham-kaas', product: products[4])
  ];

  List<Product> newProducts = List.from(productstest);

  onItemChanged(String value) {
    setState(() {
      newProducts = productstest.where((string) => string.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoSearchTextField(
              placeholder: 'Zoek',
              onChanged: onItemChanged,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 20.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorystest.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Text(categorystest[index].name),
                      index != (categorystest.length - 1)
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: SizedBox(width: 5.0, child: Text('-')),
                            )
                          : const SizedBox()
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            newProducts.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: newProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .restorablePush(_modalBuilder2, arguments: {'product': newProducts[index].id});
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                            image: DecorationImage(
                                              image: AssetImage('assets/ProductPage/${newProducts[index].image}'),
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
                                                newProducts[index].name,
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text('€ ' + newProducts[index].price.toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).restorablePush(_modalBuilder,
                                                arguments: {'product': newProducts[index].id});
                                          },
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.topRight,
                                            child: const Icon(
                                              CupertinoIcons.add_circled_solid,
                                              size: 40,
                                              color: Color.fromRGBO(6, 50, 58, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 65.0),
                                        child: Text(
                                          newProducts[index].shortDescription,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
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
                  )
                : const Center(child: Text('Geen resultaten'))
          ],
        ),
      ),
    );
  }
}
