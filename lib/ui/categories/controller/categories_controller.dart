import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';

class CategoriesController extends StateController<List<Product>> {

  CategoriesController({this.homeRepository});

  final HomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }

}