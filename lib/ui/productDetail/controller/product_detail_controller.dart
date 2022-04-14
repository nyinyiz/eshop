import 'package:eshop/domain/models/product.dart';
import 'package:eshop/domain/repository/home_repository.dart';
import 'package:get/get.dart';

class ProductDetailController extends StateController<List<Product>> {
  ProductDetailController({this.homeRepository});

  final HomeRepository homeRepository;

  final currentIndex = 0.obs;

  void changeImageIndex(int index) {
    currentIndex.value = index;
    update();
  }

  int getImageIndex() => currentIndex.value;

  @override
  void onInit() {
    super.onInit();
    futurize(() => homeRepository.getAllProductList);
  }

  Product getProductDetail(String id) {
    final index = int.tryParse(id);
    return index != null ? state[index] : state.first;
  }

  String getDiscountPrice(String id) {
    final index = int.tryParse(id);
    Product product = (index != null) ? state[index] : state.first;

    if (product.discountPercent.isBlank || product.discountPercent.isEqual(0)) {
      return product.price;
    } else {
      final totalPrice = int.parse(product.price) -
          _getDiscountAmount(int.parse(product.price), product.discountPercent);

      return totalPrice.toString();
    }
  }

  _getDiscountAmount(int price, int percent) => price * percent / 100;

  void goToProductDetail({int index}) {
    Get.toNamed(
      '/home/category/productlist/productdetail?id=$index',
    );
  }
}
