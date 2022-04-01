class Product {
  int id;
  String name;
  String image;
  double price;
  ProductCategory category;
  String shortDescription;
  String longDescription;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.shortDescription,
    required this.longDescription,
  });
}

class ProductOption {
  String name;
  Product product;

  ProductOption({
    required this.name,
    required this.product,
  });
}

class ProductEnvironment {
  String name;
  String location;
  String logo;
  String bgImage;

  ProductEnvironment(
      {required this.name,
      required this.location,
      required this.logo,
      required this.bgImage});
}

class ProductCategory {
  String name;
  ProductEnvironment environment;

  ProductCategory({
    required this.name,
    required this.environment,
  });
}
