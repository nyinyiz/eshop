import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';

class ProductListController extends StateController<List<Product>> {
  ProductListController({this.homeRepository});
  final HomeRepository homeRepository;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }
}