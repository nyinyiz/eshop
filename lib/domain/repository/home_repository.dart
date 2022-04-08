import 'package:eshop/domain/models/product.dart';

abstract class HomeRepository {

  Future<Product> getProductDetail(int productId);
  Future<List<Product>> getAllProductList();
  Future<List<Product>> getProductListByCategory(int category);
  Future<List<Product>> getRandomProductList();
  Future<List<Product>> getDiscountProductList();
}
