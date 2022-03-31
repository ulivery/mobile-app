import 'package:flutter/cupertino.dart';
import 'package:ulivery_mobile_app/model.dart';
import 'package:ulivery_mobile_app/pages/base.dart';
import 'package:ulivery_mobile_app/pages/product.dart';

class ProductEnvironmentPage extends BasicPage {
  static List<ProductEnvironment> productEnvironments = [
    ProductEnvironment(
        name: 'Vitam',
        location: 'Heerlen Zuyd Hogeschool',
        logo: 'vitam_logo.png',
        bgImage: 'vitam_background.png'),
    ProductEnvironment(
      name: 'Subway',
      location: 'Heerlen Saroleastraat',
      logo: 'subway_logo.png',
      bgImage: 'subway_background.png',
    ),
    ProductEnvironment(
      name: 'McDonald\'s',
      location: 'Heerlen Bongerd',
      logo: 'mcdonalds_logo.png',
      bgImage: 'mcdonalds_background.png',
    ),
  ];

  const ProductEnvironmentPage({Key? key}) : super(title: "Ulivery", key: key);

  @override
  BasicPageState<ProductEnvironmentPage> createState() =>
      _ProductEnvironmentPageState();
}

class _ProductEnvironmentPageState
    extends BasicPageState<ProductEnvironmentPage> {
  List<ProductEnvironment> newProductEnvironments =
      List.from(ProductEnvironmentPage.productEnvironments);

  onItemChanged(String value) {
    setState(() {
      newProductEnvironments = ProductEnvironmentPage.productEnvironments
          .where((string) =>
              string.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: 'Zoek',
            onChanged: onItemChanged,
          ),
          const SizedBox(
            height: 8,
          ),
          newProductEnvironments.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: newProductEnvironments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute<void>(
                              builder: (BuildContext context) {
                                return ProductPage(
                                  productEnvironment:
                                      newProductEnvironments[index],
                                  title: newProductEnvironments[index].name,
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 240.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/ProductEnvironmentPage/${newProductEnvironments[index].bgImage}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: Image.asset(
                                      'assets/ProductEnvironmentPage/${newProductEnvironments[index].logo}'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${newProductEnvironments[index].name} - ${newProductEnvironments[index].location}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const Center(child: Text('Geen resultaten'))
        ],
      ),
    );
  }
}
