import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:eshop/ui/productDetail/view/product_detail_screen.dart';
import 'package:get/get.dart';

class ProductListController extends StateController<List<Product>> {
  ProductListController({this.homeRepository});

  final HomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }

  void goToProductDetail({int index}) {
    Get.toNamed('/home/category/productlist/productdetail?id=$index');
  }
}
