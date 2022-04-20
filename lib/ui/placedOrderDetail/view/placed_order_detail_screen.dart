import 'package:eshop/common/common.dart';
import 'package:eshop/domain/models/cart_model.dart';
import 'package:eshop/ui/placedOrderDetail/controller/placed_order_detail_controller.dart';
import 'package:get/get.dart';

class PlacedOrderDetailScreen extends GetView<PlacedOrderDetailController> {
  const PlacedOrderDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameter = Get.parameters;
    final orderId = parameter['id'] ?? '';

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
      body: controller.obx((state) => SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "Order #" +
                                    controller.getOrderDetail(orderId)?.id ??
                                "#",
                            style:
                                context.toPop10RegularFont(Palette.colorGrey)),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            "Placed on " +
                                    controller
                                        .getOrderDetail(orderId)
                                        ?.placedTime ??
                                "",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack)),
                        Divider(),
                        SizedBox(
                          height: 8,
                        ),
                        Wrap(children: [
                          Text("Order status : ",
                              style: context
                                  .toPop14RegularFont(Palette.colorBlack)),
                          SizedBox(
                            width: 16,
                          ),
                          Text("Processing",
                              style: context
                                  .toPop14RegularFont(Palette.colorGreen)
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ]),
                        Divider(),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Delivery address",
                          style: context.toPop14RegularFont(Palette.colorBlack),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          controller.getOrderDetail(orderId)?.address ?? "",
                          style: context.toPop12RegularFont(Palette.colorGrey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Contact number",
                          style: context.toPop14RegularFont(Palette.colorBlack),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          controller.getOrderDetail(orderId)?.contactNumber ??
                              "",
                          style: context.toPop12RegularFont(Palette.colorGrey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Estimated delivery date",
                          style: context.toPop14RegularFont(Palette.colorBlack),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          controller
                                  .getOrderDetail(orderId)
                                  ?.estimateDeliveryDate ??
                              "",
                          style: context.toPop12RegularFont(Palette.colorGrey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Divider(),
                        Text(
                          "Review your order",
                          style: context.toPop14RegularFont(Palette.colorBlack),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller
                                      .getOrderDetail(orderId)
                                      ?.cartModel
                                      ?.length ??
                                  0,
                              itemBuilder: (context, index) => _cartProductView(
                                  context: context,
                                  model: controller
                                      .getOrderDetail(orderId)
                                      ?.cartModel[index])),
                        ),
                        Divider(),
                        Text("Order Summary",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack)),
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text(
                                "Subtotal",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing: Text(
                                "${getBaht()}${controller.getOrderDetail(orderId)?.subTotal}",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text(
                                "ShippingFee",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing: Text(
                                "Free",
                                style: context
                                    .toPop14RegularFont(Colors.green.shade600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text(
                                "Discount",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing: Text(
                                "-${getBaht()}${controller.getOrderDetail(orderId)?.discount}",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Divider(),
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text(
                                "Total(Include of VAT)",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing: Text(
                                "${getBaht()}${controller.getOrderDetail(orderId)?.totalPrice}",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text(
                                "Estimated VAT",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing: Text(
                                "${getBaht()}${controller.getOrderDetail(orderId)?.estimateVat}",
                                style: context
                                    .toPop14RegularFont(Palette.colorBlack),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Palette.colorDeepOrangeAccent,
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Close',
                              style: context
                                  .toPop18SemiBoldFont(Palette.colorWhite),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _cartProductView({BuildContext context, CartModel model}) => SizedBox(
        child: Container(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                controller
                        .getProductDetail(model.productId.toString())
                        .images[0] +
                    model.productId.toString(),
                cacheHeight: 150,
                cacheWidth: 180,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
                controller.getProductDetail(model.productId.toString()).title,
                style: context.toPop14RegularFont(Palette.colorBlack)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller
                      .getProductDetail(model.productId.toString())
                      .brand
                      .name,
                  style: context.toPop10RegularFont(Palette.colorGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                    getBaht() +
                        controller
                            .getProductDetail(model.productId.toString())
                            .price,
                    style: context.toPop14RegularFont(Palette.colorBlack)),
                Divider(),
                Text(
                    "available discount: " +
                            controller
                                .getProductDetail(model.productId.toString())
                                .discountPercent
                                .toString() +
                            "%" ??
                        "",
                    style: context.toPop12RegularFont(Palette.colorBlue)),
                SizedBox(
                  height: 8,
                )
              ],
            ),
            trailing: Text(model.count.toString() ?? "0",
                style: context.toPop12RegularFont(Palette.colorBlack)),
          ),
        ),
      );
}
