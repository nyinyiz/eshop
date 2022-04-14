import 'package:dartz/dartz.dart';
import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends StateController<List<Product>> {
  HomeController({this.homeRepository});

  final HomeRepository homeRepository;

  final currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
    update();
  }

  int getTabIndex() => currentIndex.value;

  @override
  void onInit() {
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }
}
