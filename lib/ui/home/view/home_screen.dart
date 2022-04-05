import 'package:badges/badges.dart';
import 'package:eshop/common/common.dart';
import 'package:eshop/ui/home/controller/home_controller.dart';
import 'package:eshop/ui/shop/view/shop_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  final List _widgetOptions = [
    ShopScreen("Shop Page"),
    ShopScreen("Categories Page"),
    ShopScreen("Profile Page"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: controller.obx((state) {
          return Text(
            "E-Shop ( ${controller.state.length} )",
            style: TextStyle(color: Colors.black),
          );
        }),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),
          Badge(
            badgeColor: Palette.colorDeepOrangeAccent,
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              "0",
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                onPressed: () {}),
          )
        ],
      ),
      body: Obx(
        () => Container(
          child: Center(
            child: _widgetOptions.elementAt(controller.getTabIndex()),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined), label: "Profile")
          ],
          currentIndex: controller.getTabIndex(),
          selectedItemColor: Palette.colorDeepOrangeAccent,
          onTap: controller.changeTabIndex,
        ),
      ),
    );
  }
}
