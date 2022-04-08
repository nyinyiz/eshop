import 'package:eshop/domain/remote/home_provider.dart';
import 'package:eshop/domain/remote/home_provider_impl.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:eshop/domain/repository/home_repository_impl.dart';
import 'package:eshop/ui/home/controller/home_controller.dart';
import 'package:eshop/ui/shop/controller/ShopController.dart';
import 'package:get/get.dart';

import '../../ui/categories/controller/categories_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProviderImpl());
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
    Get.lazyPut(() => ShopController(homeRepository: Get.find()));
    Get.lazyPut(() => CategoriesController(homeRepository: Get.find()));
  }

}