import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/main.dart';
import 'package:ulivery_mobile_app/pages/base.dart';
import 'package:ulivery_mobile_app/pages/product.dart';
import 'package:ulivery_mobile_app/util/utils.dart';

class ProductEnvironmentPage extends BasicPage {
  const ProductEnvironmentPage({Key? key}) : super(title: "Shops", key: key);

  @override
  BasicPageState<ProductEnvironmentPage> createState() => _ProductEnvironmentPageState();
}

class _ProductEnvironmentPageState extends BasicPageState<ProductEnvironmentPage> {
  String _search = "";

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: 'Zoek',
            onChanged: (v) {
              setState(() {
                _search = v;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: FutureBuilder(
              key: ValueKey(_search),
              future: UliveryApp.catalog.getEnvironments(search: _search),
              builder: (BuildContext context, AsyncSnapshot<List<ProductEnvironment>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return FutureUtils.noResults();
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      ProductEnvironment environment = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => ProductPage(environment: environment)));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 240.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                image: DecorationImage(
                                  image: NetworkImage(environment.background),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: Image.network(environment.logo),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${environment.name} - ${environment.address.address}',
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
    );
  }
}
