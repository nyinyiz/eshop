import 'package:eshop/domain/models/address_model.dart';
import 'package:eshop/domain/models/home_data.dart';
import 'package:eshop/domain/models/notification_model.dart';
import 'package:eshop/domain/models/product_model.dart';

abstract class HomeRepository {
  Future<HomeData> getHomeData();

  Future<DataProduct> getProductDetail(int productId);

  Future<List<DataProduct>> getAllProductList();

  Future<List<DataProduct>> getProductListByCategory(int category);

  Future<List<DataProduct>> getRandomProductList();

  Future<List<DataProduct>> getDiscountProductList();

  Future<List<NotificationModel>> getNotificationList();

  Future<List<AddressModel>> getAddressList();


}
