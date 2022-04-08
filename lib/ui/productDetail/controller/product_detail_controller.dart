import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';

class ProductDetailController extends StateController<List<Product>> {
  ProductDetailController({this.homeRepository});

  final HomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }

  Product getProductDetail(String id) {
    final index = int.tryParse(id);
    return index != null ? state[index] : state.first;
  }

}
