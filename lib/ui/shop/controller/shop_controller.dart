import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';

class ShopController extends StateController<List<Product>> {
  ShopController({this.homeRepository});

  final HomeRepository homeRepository;

  final selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  int getTabIndex() => selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }

  //GetX prevent accidental push to screen twice. Use "preventDuplicates:false" to avoid this behaviour
  void goToProductList({int index, int type}) {
    Get.toNamed('/home/shop/productlist?type=$type&categoryId=$index');
  }

}
