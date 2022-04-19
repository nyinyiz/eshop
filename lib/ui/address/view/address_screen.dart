import 'package:eshop/common/common.dart';
import 'package:eshop/domain/models/address_model.dart';
import 'package:eshop/ui/address/controller/address_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController postalCodeController = TextEditingController();

    final parameter = Get.parameters;
    final tag = parameter['tag'] ?? "";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Addresses",
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
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => {
                      Get.bottomSheet(
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                Text(
                                  "New address",
                                  style: context
                                      .toPop18SemiBoldFont(Palette.colorBlack),
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: nameController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'Full name',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: phoneNumberController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'Phone number',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: emailController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'Email (Optional)',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: addressController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'Addresses line 1',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: cityController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'City',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: countryController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'Country',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 16),
                                TextField(
                                  controller: postalCodeController,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue.shade100,
                                      labelText: 'PostalCode',
                                      labelStyle: context.toPop14RegularFont(
                                          Palette.colorBlack)),
                                  onChanged: (text) {},
                                ),
                                SizedBox(height: 22),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Palette.colorDeepOrangeAccent,
                                      onPrimary: Colors.white,
                                    ),
                                    onPressed: () {
                                      _validateForm(
                                              nameController,
                                              phoneNumberController,
                                              emailController,
                                              addressController,
                                              cityController,
                                              countryController,
                                              postalCodeController)
                                          ? submitAddress(
                                              nameController,
                                              phoneNumberController,
                                              emailController,
                                              addressController,
                                              cityController,
                                              countryController,
                                              postalCodeController)
                                          : Get.snackbar("Error",
                                              "Please fill full data.");
                                    },
                                    child: Text(
                                      'Save',
                                      style: context.toPop14RegularFont(
                                          Palette.colorWhite),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    },
                    child: const Text('Add new Address'),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: Palette.colorLightGrey,
                          ),
                      shrinkWrap: false,
                      itemCount: controller?.getAddressList()?.length ?? 0,
                      itemBuilder: (context, index) =>
                          _notificationView(context, index, tag)),
                ))
              ],
            ),
          )),
    );
  }

  Widget _notificationView(BuildContext context, int index, String tag) => Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () => (tag.isBlank)
              ? null
              : _confirmOrderDetail(
                  context, controller?.getAddressList()[index]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 24.0,
                      color: Palette.colorBlack,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      controller?.getAddressList()[index].name ?? "",
                      style: context
                          .toPop14RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    controller?.getAddressList()[index].address +
                            "\n" +
                            controller?.getAddressList()[index].city +
                            "\n" +
                            controller?.getAddressList()[index].country +
                            "\n" +
                            controller?.getAddressList()[index].postalCode +
                            "\n" +
                            controller?.getAddressList()[index].phoneNumber +
                            "\n" +
                            controller?.getAddressList()[index].email ??
                        "",
                    style: context.toPop14RegularFont(Palette.colorGrey),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  bool _validateForm(
      TextEditingController nameController,
      TextEditingController phoneNumberController,
      TextEditingController emailController,
      TextEditingController addressController,
      TextEditingController cityController,
      TextEditingController countryController,
      TextEditingController postalCodeController) {
    if (nameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        addressController.text.isEmpty ||
        cityController.text.isEmpty ||
        countryController.text.isEmpty ||
        postalCodeController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void submitAddress(
      TextEditingController nameController,
      TextEditingController phoneNumberController,
      TextEditingController emailController,
      TextEditingController addressController,
      TextEditingController cityController,
      TextEditingController countryController,
      TextEditingController postalCodeController) {
    final model = controller.getAddressData(
        name: nameController.text,
        phone: phoneNumberController.text,
        email: emailController?.text ?? "",
        address: addressController.text,
        city: cityController.text,
        country: countryController.text,
        postalCode: postalCodeController.text);

    controller.addAddressContent(model);
    Get.back();
  }

  void submitOrder(AddressModel addressModel) {
    var today = new DateTime.now();

    var todayDate = DateFormat("dd MMM yyyy").format(today);

    final model = controller.getOrderedData(
        cartModel: controller.getCartList(),
        totalPrice: controller.getTotalIncludeVAT().toString(),
        placedTime: todayDate,
        address: addressModel.address +
            ", " +
            addressModel.city +
            ", " +
            addressModel.country +
            ", " +
            addressModel.postalCode,
        contactNumber: addressModel.phoneNumber + ", " + addressModel.email,
        estimateDeliveryDate: controller.getEstimateDeliveryDate(),
        subTotal: controller.getOrderSubTotal().toString(),
        discount: controller.getOrderDiscount().toString(),
        estimateVat: getVAT().toString());

    controller.addOrderedContent(model);

    Get.back();

    Get.snackbar("Successful", "Your order have been placed.");

    controller.clearAllCart();
    controller.goToOrdersList();
  }

  void _deleteConfirmDialog(BuildContext ctx) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Delete',
          style: ctx.toPop18SemiBoldFont(Palette.colorBlack),
        ),
        content: Text(
          'Are you sure you want to delete all address?',
          style: ctx.toPop18RegularFont(Palette.colorBlack),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("Ok"),
            onPressed: () {
              controller.clearAllAddress();
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void _confirmOrderDetail(BuildContext ctx, AddressModel addressModel) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Container(
                width: MediaQuery.of(ctx).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        null,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Order detail",
                      style: ctx.toPop18RegularFont(Palette.colorBlack),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(ctx).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery address",
                      style: ctx.toPop14RegularFont(Palette.colorBlack),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      addressModel.address +
                          ", " +
                          addressModel.city +
                          ", " +
                          addressModel.country +
                          ", " +
                          addressModel.postalCode,
                      style: ctx.toPop12RegularFont(Palette.colorGrey),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Contact number",
                      style: ctx.toPop14RegularFont(Palette.colorBlack),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      addressModel.phoneNumber + ", " + addressModel.email,
                      style: ctx.toPop12RegularFont(Palette.colorGrey),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Estimated delivery date",
                      style: ctx.toPop14RegularFont(Palette.colorBlack),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      controller.getEstimateDeliveryDate() ?? "",
                      style: ctx.toPop12RegularFont(Palette.colorGrey),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    Text(
                      "Review your order",
                      style: ctx.toPop14RegularFont(Palette.colorBlack),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.getCartList().length ?? 0,
                          itemBuilder: _cartProductView),
                    ),
                    Divider(),
                    Text("Order Summary",
                        style: ctx.toPop14RegularFont(Palette.colorBlack)),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "Subtotal",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "${getBaht()}${controller.getOrderSubTotal()}",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "ShippingFee",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "Free",
                            style:
                                ctx.toPop14RegularFont(Colors.green.shade600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "Discount",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "-${getBaht()}${controller.getOrderDiscount()}",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
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
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "${getBaht()}${controller.getTotalIncludeVAT()}",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(
                            "Estimated VAT",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          trailing: Text(
                            "${getBaht()}${getVAT()}",
                            style: ctx.toPop14RegularFont(Palette.colorBlack),
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
                      width: MediaQuery.of(ctx).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Palette.colorDeepOrangeAccent,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          submitOrder(addressModel);
                        },
                        child: Text(
                          'Confirm order',
                          style: ctx.toPop18SemiBoldFont(Palette.colorWhite),
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
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _cartProductView(BuildContext context, int index) => SizedBox(
        child: Container(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                controller
                        .getProductDetail(controller
                            .getCartList()[index]
                            .productId
                            .toString())
                        .images[0] +
                    index.toString(),
                cacheHeight: 150,
                cacheWidth: 180,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
                controller
                    .getProductDetail(
                        controller.getCartList()[index].productId.toString())
                    .title,
                style: context.toPop14RegularFont(Palette.colorBlack)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller
                      .getProductDetail(
                          controller.getCartList()[index].productId.toString())
                      .brand
                      .name,
                  style: context.toPop10RegularFont(Palette.colorGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                    getBaht() +
                        controller
                            .getProductDetail(controller
                                .getCartList()[index]
                                .productId
                                .toString())
                            .price,
                    style: context.toPop14RegularFont(Palette.colorBlack)),
                Divider(),
                Text(
                    "available discount: " +
                            controller
                                .getProductDetail(controller
                                    .getCartList()[index]
                                    .productId
                                    .toString())
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
            trailing: Text(
                controller.getCartList()[index]?.count.toString() ?? "0",
                style: context.toPop12RegularFont(Palette.colorBlack)),
          ),
        ),
      );
}
