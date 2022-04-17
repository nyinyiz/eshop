import 'package:eshop/common/common.dart';
import 'package:eshop/route/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_test/get_test.dart';

Widget makeTestableWidget() => MaterialApp(home: Image.network(''));

void main() {

  getTest(
    "Home page navigation test",
    getPages: AppPages.routes,
    initialRoute: AppPages.INITIAL,
    widgetTest: (tester) async {

      expect('/home', Get.currentRoute);

      Get.toNamed('/home/shop');
      expect('/home/shop', Get.currentRoute);

      Get.toNamed('/home/category');
      expect('/home/category', Get.currentRoute);

      Get.toNamed('/home/profile');
      expect('/home/profile', Get.currentRoute);

      Get.toNamed('/home/notification');
      expect('/home/notification', Get.currentRoute);

      Get.back();

      Get.toNamed('/home/category');
      expect('/home/category', Get.currentRoute);

      Get.toNamed('/home/productlist');
      expect('/home/productlist', Get.currentRoute);

      Get.back();

      expect('/home/category', Get.currentRoute);

    },
  );
}
