import 'dart:convert';

import 'package:eshop/common/common.dart';
import 'package:eshop/domain/models/address_model.dart';
import 'package:eshop/domain/models/product_model.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressController extends SuperController<List<DataProduct>> {
  AddressController({this.homeRepository});

  final HomeRepository homeRepository;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    append(() => homeRepository.getAllProductList);
  }

  List<AddressModel> getAddressList() {
    if (readList(ADDRESS_KEY) != null) {
      final data = jsonDecode(readList(ADDRESS_KEY)) as List<dynamic>;
      return data.map((e) => AddressModel.fromJson(e)).toList();
    } else {
      return List.empty();
    }
  }

  void clearAllAddress() {
    box.remove(ADDRESS_KEY);
  }

  AddressModel getAddressData(
      {String name,
      String address,
      String city,
      String country,
      String postalCode}) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    final model = AddressModel(
        id: timestamp,
        name: name,
        address: address,
        city: city,
        country: country,
        postalCode: postalCode);

    return model;
  }

  void addAddressContent(AddressModel model) {
    List<AddressModel> list = [];
    list.add(model);

    saveList(ADDRESS_KEY, list);
  }

  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
