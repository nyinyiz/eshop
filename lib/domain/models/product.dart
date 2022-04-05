import 'dart:convert';

class Product {
  int id;
  String title;
  String description;
  List<String> images;
  Brand brand;
  int category;
  String price;
  int discountPercent;
  bool favourite;
  int available;

  Product(
      {this.id,
      this.title,
      this.description,
      this.images,
      this.brand,
      this.category,
      this.price,
      this.discountPercent,
      this.favourite,
      this.available});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    category = json['category'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    favourite = json['favourite'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['images'] = this.images;
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    data['category'] = this.category;
    data['price'] = this.price;
    data['discountPercent'] = this.discountPercent;
    data['favourite'] = this.favourite;
    data['available'] = this.available;
    return data;
  }
}

class Brand {
  String name;
  String shippingFrom;
  String address;

  Brand({this.name, this.shippingFrom, this.address});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shippingFrom = json['shippingFrom'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shippingFrom'] = this.shippingFrom;
    data['address'] = this.address;
    return data;
  }
}
