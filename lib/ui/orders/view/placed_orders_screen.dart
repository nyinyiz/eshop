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
        actions: [
          IconButton(
            onPressed: () {
              _deleteConfirmDialog(context);
            },
            icon: Icon(
              Icons.delete_sweep_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: controller.obx((state) => Container(
            child: state?.length == 0
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 200,
                              height: 200,
                              child:
                                  Image.asset('assets/images/cartempty.png')),
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
                            style:
                                context.toPop14RegularFont(Palette.colorGrey),
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
                              style: context
                                  .toPop18SemiBoldFont(Palette.colorWhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        padding: EdgeInsets.only(
                            bottom: 32, top: 16, left: 16, right: 16),
                        itemCount: state?.length ?? 0,
                        itemBuilder: _placedOrderView),
                  ),
          )),
    );
  }

  Widget _placedOrderView(BuildContext context, int index) => Container(
        child: Card(
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order #" + controller.state[index].id ?? "#",
                    style: context.toPop10RegularFont(Palette.colorGrey)),
                SizedBox(
                  height: 8,
                ),
                Text("Placed on " + controller.state[index].placedTime ?? "",
                    style: context.toPop12RegularFont(Palette.colorBlack)),
                Divider(),
                Wrap(children: [
                  Text("Order status : ",
                      style: context.toPop12RegularFont(Palette.colorBlack)),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Processing",
                      style: context
                          .toPop12RegularFont(Palette.colorGreen)
                          .copyWith(fontWeight: FontWeight.bold)),
                ]),
                SizedBox(
                  height: 8,
                ),
                Wrap(children: [
                  Text("Estimated delivery date : ",
                      style: context.toPop12RegularFont(Palette.colorBlack)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(controller.state[index].estimateDeliveryDate ?? "",
                      style: context
                          .toPop12RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold)),
                ]),
                SizedBox(
                  height: 8,
                ),
                Wrap(children: [
                  Text("Total product : ",
                      style: context.toPop12RegularFont(Palette.colorBlack)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                      controller.state[index].cartModel.length.toString() +
                              " items" ??
                          "0 items",
                      style: context
                          .toPop12RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold)),
                ]),
                SizedBox(
                  height: 8,
                ),
                Wrap(children: [
                  Text("ShippingFee : ",
                      style: context.toPop12RegularFont(Palette.colorBlack)),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Free",
                      style: context
                          .toPop12RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold)),
                ]),
                SizedBox(
                  height: 8,
                ),
                Wrap(children: [
                  Text("Total amount (include of VAT) : ",
                      style: context.toPop12RegularFont(Palette.colorBlack)),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                      getBaht() + controller.state[index].totalPrice ??
                          "${getBaht()}0",
                      style: context
                          .toPop12RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold)),
                ]),
              ],
            ),
          ),
        ),
      );

  void _deleteConfirmDialog(BuildContext ctx) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Delete',
          style: ctx.toPop18SemiBoldFont(Palette.colorBlack),
        ),
        content: Wrap(
          children: [
            Text(
              'Are you sure you want to delete all orders?',
              style: ctx.toPop18RegularFont(Palette.colorBlack),
            ),
            Text(
              '(*btw actually this is developer mode, Actual world you can\'t delete any processing order list from your account but you can cancel your order by follow company rule.)',
              style: ctx.toPop10RegularFont(Palette.colorRed),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("Ok"),
            onPressed: () {
              controller.clearAllOrders();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
