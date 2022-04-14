import 'package:eshop/domain/bindings/home_binding.dart';
import 'package:eshop/ui/categories/view/categories_screen.dart';
import 'package:eshop/ui/home/view/home_screen.dart';
import 'package:eshop/ui/productDetail/view/product_detail_screen.dart';
import 'package:eshop/ui/productlist/view/productlist_screen.dart';
import 'package:eshop/ui/shop/view/shop_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomeScreen(), bindings: [
      HomeBinding()
    ], children: [
      GetPage(
          name: Routes.SHOP,
          page: () => ShopScreen(""),
          binding: HomeBinding(),
          children: [
            GetPage(
                name: Routes.PRODUCTLIST,
                page: () => ProductListScreen(),
                binding: HomeBinding(),
                children: [
                  GetPage(
                    name: Routes.PRODUCTDETAIL,
                    page: () => ProductDetailScreen(),
                    binding: HomeBinding(),
                  )
                ])
          ]),
      GetPage(
          name: Routes.CATEGORY,
          page: () => CategoriesScreen(),
          binding: HomeBinding(),
          children: [
            GetPage(
                name: Routes.PRODUCTLIST,
                page: () => ProductListScreen(),
                binding: HomeBinding(),
                children: [
                  GetPage(
                    name: Routes.PRODUCTDETAIL,
                    page: () => ProductDetailScreen(),
                    binding: HomeBinding(),
                  )
                ])
          ]),
    ]),
  ];
}
