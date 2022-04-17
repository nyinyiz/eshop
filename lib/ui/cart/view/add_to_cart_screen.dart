import 'package:cart_stepper/cart_stepper.dart';
import 'package:eshop/common/common.dart';
import 'package:eshop/ui/cart/controller/add_to_cart_controller.dart';
import 'package:get/get.dart';

class AddToCartScreen extends GetView<AddToCartController> {
  const AddToCartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "My Order",
          style: context.toPopBoldFont(Palette.colorBlack),
        ),
        centerTitle: true,
      ),
      body: controller.obx((state) => Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                            bottom: 32, top: 16, left: 16, right: 16),
                        shrinkWrap: true,
                        itemCount: state?.length ?? 0,
                        itemBuilder: _cartProductView),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Text("Your Voucher Code",
                        style: context
                            .toPop14RegularFont(Palette.colorBlack)
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "Enter Voucher Code",
                          hintStyle:
                              context.toPop12RegularFont(Palette.colorGrey),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white10,
                          suffixIcon: TextButton.icon(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(8), // <-- Radius
                                ),
                                elevation: 0,
                                backgroundColor: Colors.cyan.shade600),
                            icon: Icon(
                              Icons.qr_code_scanner_rounded,
                              color: Palette.colorWhite,
                            ),
                            label: Text(
                              "Apply",
                              style: context
                                  .toPop12RegularFont(Palette.colorWhite),
                            ),
                          )),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Order Summary",
                        style: context
                            .toPop14RegularFont(Palette.colorBlack)
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "Subtotal",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "${getBaht()}15000",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "ShippingFee",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
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
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "-${getBaht()}140",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
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
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "-${getBaht()}14900",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "Estimated VAT",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "${getBaht()}70",
                            style:
                                context.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Palette.colorDeepOrangeAccent,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          controller.goToAddressesScreen();
                        },
                        child: Text(
                          'Continue',
                          style:
                              context.toPop18SemiBoldFont(Palette.colorWhite),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _cartProductView(BuildContext context, int index) => SizedBox(
        child: Card(
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                controller.state[index].images[0],
                cacheHeight: 150,
                cacheWidth: 180,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(controller.state[index].title,
                style: context.toPop14RegularFont(Palette.colorBlack)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.state[index].brand.name,
                  style: context.toPop10RegularFont(Palette.colorGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(getBaht() + controller.state[index].price,
                    style: context.toPop14RegularFont(Palette.colorBlack))
              ],
            ),
            trailing: Container(
              child: CartStepperInt(
                count: controller.getCount(),
                size: 26,
                elevation: 0,
                activeBackgroundColor: Colors.black87,
                activeForegroundColor: Palette.colorWhite,
                didChangeCount: (count) {
                  controller.changeCount(count);
                },
              ),
            ),
          ),
        ),
      );
}
