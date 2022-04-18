import 'package:eshop/common/common.dart';
import 'package:eshop/ui/orders/controller/placed_orders_controller.dart';
import 'package:get/get.dart';

class PlacedOrdersScreen extends GetView<PlacedOrdersController> {
  const PlacedOrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Placed orders",
          style: context.toPopBoldFont(Palette.colorBlack),
        ),
        centerTitle: true,
      ),
      body: controller.obx((state) => Container(
            child: state?.length == 0 ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/cartempty.png')),
                    Text(
                      "You don't have any order yet.",
                      style: context
                          .toPop28RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Please checkout from bucket list or explore on more product.",
                      style: context.toPop14RegularFont(Palette.colorGrey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: StadiumBorder(),
                        primary: Palette.colorRed,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Explore',
                        style: context.toPop18SemiBoldFont(Palette.colorWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ) : Container(child: Text("Placed Orders"),),
          )),
    );
  }
}
