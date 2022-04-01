import 'dart:convert';

import 'package:fluri/fluri.dart';
import 'package:http/http.dart' as http;
import 'package:ulivery_mobile_app/api/models.dart';
import 'package:ulivery_mobile_app/api/wrapper.dart';

class Catalog extends Wrapper {
  Catalog() : super(Fluri("https://catalog.ulivery.nl/"));

  Future<List<ProductEnvironment>> getEnvironments({String search = ""}) async {
    List<ProductEnvironment> environments = [];

    var response = await http.get(getUri("api/environments", params: {"name": search}));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      for (var item in json) {
        environments.add(ProductEnvironment.fromJson(item));
      }
      return environments;
    }

    throw ApiException(response.statusCode, response.body);
  }

  Future<List<ProductCategory>> getCategories({required int environmentId}) async {
    List<ProductCategory> categories = [];

    var response = await http.get(getUri("api/categories", params: {"environment": environmentId.toString()}));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      for (var item in json) {
        categories.add(ProductCategory.fromJson(item));
      }
      return categories;
    }

    throw ApiException(response.statusCode, response.body);
  }

  Future<List<Product>> getProducts({required int categoryId}) async {
    List<Product> products = [];

    var response = await http.get(getUri("api/categories/$categoryId/products"));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      for (var item in json) {
        products.add(Product.fromJson(item));
      }
      return products;
    }

    throw ApiException(response.statusCode, response.body);
  }
}
