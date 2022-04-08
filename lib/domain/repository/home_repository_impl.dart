import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/remote/home_provider.dart';
import 'package:eshop/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({this.provider});

  final HomeProvider provider;

  @override
  Future<Product> getProductDetail(int productId) async {
    final productList = await provider.getAllProductList();
    if (productList.isEmpty) {
      return Future.error("Response : Empty product Detail");
    } else {
      return productId != null ? productList[productId] : productList.first;
    }
  }

  @override
  Future<List<Product>> getAllProductList() async {
    final productList = await provider.getAllProductList();
    if (productList.isEmpty) {
      return Future.error("Response : Empty product list");
    } else {
      return productList;
    }
  }

  @override
  Future<List<Product>> getDiscountProductList() {
    // TODO: implement getDiscountProductList
    throw UnimplementedError();
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
