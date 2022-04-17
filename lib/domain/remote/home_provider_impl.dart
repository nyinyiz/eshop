import 'dart:convert';

import 'package:eshop/common/common.dart';
import 'package:eshop/domain/models/address_model.dart';
import 'package:eshop/domain/models/home_data.dart';
import 'package:eshop/domain/models/notification_model.dart';
import 'package:eshop/domain/models/product_model.dart';
import 'package:eshop/domain/remote/home_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeProviderImpl extends GetConnect implements HomeProvider {


  @override
  void onInit() {
    /** implement onInit
        Setup http client and network URL here.
        I will skip here because I am using local json data for the current flow. */
    super.onInit();
  }


  @override
  Future<List<NotificationModel>> getNotificationList() async {
    final String response = await rootBundle.loadString('assets/sample/notification_data.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((e) => NotificationModel.fromJson(e)).toList();
  }

  @override
  Future<List<DataProduct>> getAllProductList() async {
    final String response =
        await rootBundle.loadString('assets/sample/sampleProduct.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((e) => DataProduct.fromJson(e)).toList();
  }

  @override
  Future<List<DataProduct>> getDiscountProductList() async {
    final String response =
        await rootBundle.loadString('assets/sample/sampleProduct.json');
    final data = json.decode(response) as List<dynamic>;
    return data.map((e) => DataProduct.fromJson(e)).toList();
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
  Future<HomePageData> getHomeData() async {
    final String response =
        await rootBundle.loadString('assets/sample/home_data.json');
    final data = json.decode(response);
    return HomePageData.fromJson(data);
  }

  @override
  Future<List<AddressModel>> getAddressList() {
    final box = GetStorage();
    return box.read(ADDRESS_KEY);
  }

}
