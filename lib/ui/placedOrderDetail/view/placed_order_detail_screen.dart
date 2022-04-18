import 'package:eshop/common/common.dart';
import 'package:eshop/ui/placedOrderDetail/controller/placed_order_detail_controller.dart';
import 'package:get/get.dart';

class PlacedOrderDetailScreen extends GetView<PlacedOrderDetailController> {
  const PlacedOrderDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Order detail",
          style: context.toPopBoldFont(Palette.colorBlack),
        ),
        centerTitle: true,
      ),
      body: controller.obx((state) => Container(
            child: Text("Order detail"),
          )),
    );
  }
}
