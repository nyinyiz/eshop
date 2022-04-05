import 'dart:convert';

import 'package:eshop/common/common.dart';
import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/remote/home_provider.dart';
import 'package:get/get.dart';

class HomeProviderImpl extends GetConnect implements HomeProvider {
  @override
  void onInit() {
    /** implement onInit
        Setup http client and network URL here.
        I will skip here because I am using local json data for the current flow. */
    super.onInit();
  }

  @override
  Future<List<Product>> getAllProductList() async {
    final String response =
        await rootBundle.loadString('assets/sample/sampleProduct.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<List<Product>> getDiscountProductList() async {
    final String response =
        await rootBundle.loadString('assets/sample/sampleProduct.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<List<Product>> getProductListByCategory(int category) {
    // TODO: implement getProductListByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getRandomProductList() {
    // TODO: implement getRandomProductList
    throw UnimplementedError();
  }
}
