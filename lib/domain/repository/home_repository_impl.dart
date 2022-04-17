import 'package:eshop/domain/models/home_data.dart';
import 'package:eshop/domain/models/notification_model.dart';
import 'package:eshop/domain/models/product_model.dart';
import 'package:eshop/domain/remote/home_provider.dart';
import 'package:eshop/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({this.provider});

  final HomeProvider provider;


  @override
  Future<List<NotificationModel>> getNotificationList() async {
    final notificationList = await provider.getNotificationList();
    if(notificationList.isEmpty) {
      return Future.error("Response: Empty notification list");
    }else {
      return notificationList;
    }
  }

  @override
  Future<DataProduct> getProductDetail(int productId) async {
    final productList = await provider.getAllProductList();
    if (productList.isEmpty) {
      return Future.error("Response : Empty product Detail");
    } else {
      return productId != null ? productList[productId] : productList.first;
    }
  }

  @override
  Future<List<DataProduct>> getAllProductList() async {
    final productList = await provider.getAllProductList();
    if (productList.isEmpty) {
      return Future.error("Response : Empty product list");
    } else {
      return productList;
    }
  }

  @override
  Future<List<DataProduct>> getDiscountProductList() {
    // TODO: implement getDiscountProductList
    throw UnimplementedError();
  }

  @override
  Future<List<DataProduct>> getProductListByCategory(int category) {
    // TODO: implement getProductListByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<DataProduct>> getRandomProductList() {
    // TODO: implement getRandomProductList
    throw UnimplementedError();
  }

  @override
  Future<HomeData> getHomeData() async {
    final homeData = await provider.getHomeData();
    if (homeData.data == null) {
      return Future.error("Response : Empty Home Data");
    } else {
      return homeData.data;
    }
  }

}
