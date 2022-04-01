class Product {
  int id;
  String name;
  String image;
  double price;
  String shortDescription;
  String longDescription;

  Product(this.id, this.name, this.image, this.price, this.shortDescription, this.longDescription);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['id'], json['name'], json['image'], json['price'], json['shortDescription'], json['longDescription']);
  }
}

class Address {
  int id;
  String address;
  String zipCode;
  String city;
  String country;

  Address(this.id, this.address, this.zipCode, this.city, this.country);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json['id'], json['address'], json['zipCode'], json['city'], json['country']);
  }
}

class ProductEnvironment {
  int id;
  String name;
  String background;
  String logo;
  Address address;

  ProductEnvironment(this.id, this.name, this.background, this.logo, this.address);

  factory ProductEnvironment.fromJson(Map<String, dynamic> json) {
    return ProductEnvironment(
        json['id'], json['name'], json['background'], json['logo'], Address.fromJson(json['address']));
  }
}

class ProductCategory {
  int id;
  String name;

  ProductCategory(this.id, this.name);

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(json['id'], json['name']);
  }
}
