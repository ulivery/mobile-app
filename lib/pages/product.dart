import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/main.dart';
import 'package:ulivery_mobile_app/pages/base.dart';
import 'package:ulivery_mobile_app/pages/shopping_cart.dart';
import 'package:ulivery_mobile_app/util/utils.dart';

class ProductPage extends BasicPage {
  final ProductEnvironment environment;

  const ProductPage({required this.environment, Key? key})
      : super(title: "Producten", key: key);

  @override
  BasicPageState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BasicPageState<ProductPage> {
  int _category = 0;
  String _search = "";

  static Route<void> _modalBuilder2(BuildContext context, dynamic arguments) {
    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return Dismissible(
          direction: DismissDirection.down,
          key: const Key('key'),
          onDismissed: (_) => Navigator.of(context).pop(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 50,
            child: Scaffold(
              body: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Image.network(
                                arguments["productImage"],
                                fit: BoxFit.cover,
                              ),
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
                                            Image.network(
                                              'https://cdn.ulivery.nl/files/00ca11db-d274-4d33-ae3c-9176c242d61a.png',
                                              width: 50.0,
                                              height: 50.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.network(
                                              'https://cdn.ulivery.nl/files/00ca11db-d274-4d33-ae3c-9176c242d61a.png',
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
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Text(
                            arguments["productName"],
                            overflow: TextOverflow.clip,
                            style: const TextStyle(fontSize: 30.0),
                          ),
                          const SizedBox(height: 10.0),
                          Text(arguments["productLongDescription"],
                              overflow: TextOverflow.clip),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100.0)),
                          child: const Text('Voeg toe aan bestelling'),
                          onPressed: () {
                            // UliveryApp.shoppingCartProducts.add(product);
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoButton(
                          child: const Text('Kijk verder'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
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

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            Container(),
            CupertinoSearchTextField(
              placeholder: 'Zoeken',
              onChanged: (v) {
                setState(() {
                  _search = v;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 30.0,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: FutureBuilder(
                  future: UliveryApp.catalog
                      .getCategories(environmentId: widget.environment.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductCategory>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }

                      // Set category to first one
                      if (_category == 0) {
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          setState(() {
                            _category = snapshot.data![0].id;
                          });
                        });
                      }

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 5.0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          ProductCategory category = snapshot.data![index];
                          return ElevatedButton(
                            style: ButtonStyle(
                                elevation:
                                    MaterialStateProperty.all<double?>(0.0),
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    Theme.of(context).colorScheme.secondary),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).colorScheme.primary)),
                            child: Text(category.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            onPressed: () {
                              setState(() {
                                _category = category.id;
                              });
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return FutureUtils.error(snapshot.error);
                    }

                    return Container();
                  }),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: FutureBuilder(
                key: ValueKey(_search + _category.toString()),
                future: UliveryApp.catalog
                    .getProducts(categoryId: _category, search: _search),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return FutureUtils.noResults();
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = snapshot.data![index];
                        return Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .restorablePush(_modalBuilder2, arguments: {
                                  'productName': product.name,
                                  'productImage': product.image,
                                  'productShortDescription':
                                      product.shortDescription,
                                  'productLongDescription':
                                      product.longDescription
                                });
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(product.image),
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
                                                product.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text('€ ' +
                                                  product.price.toString()),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            UliveryApp.shoppingCartProducts
                                                .add(product);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(product.name +
                                                        " toegevoegd aan winkelmandje.")));
                                          },
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.topRight,
                                            child: const Icon(
                                              CupertinoIcons.add_circled_solid,
                                              size: 40,
                                              color:
                                                  Color.fromRGBO(6, 50, 58, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 65.0),
                                        child: Text(
                                          product.shortDescription,
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
                    );
                  } else if (snapshot.hasError) {
                    return FutureUtils.error(snapshot.error);
                  }

                  return FutureUtils.loading();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
