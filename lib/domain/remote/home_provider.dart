import 'package:eshop/domain/models/home_data.dart';
import 'package:eshop/domain/models/product_model.dart';

abstract class HomeProvider {
  Future<HomePageData> getHomeData();

  Future<List<DataProduct>> getAllProductList();

  Future<List<DataProduct>> getProductListByCategory(int category);

  Future<List<DataProduct>> getRandomProductList();

  Future<List<DataProduct>> getDiscountProductList();
}
