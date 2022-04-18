import 'package:eshop/common/common.dart';
import 'package:eshop/ui/address/controller/address_controller.dart';
import 'package:get/get.dart';

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController postalCodeController = TextEditingController();

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
              Icons.delete_forever_outlined,
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
                                              addressController,
                                              cityController,
                                              countryController,
                                              postalCodeController)
                                          ? submitAddress(
                                              nameController,
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
                      itemBuilder: _notificationView),
                ))
              ],
            ),
          )),
    );
  }

  Widget _notificationView(BuildContext context, int index) => Card(
        child: InkWell(
          onTap: () => {},
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
                            controller?.getAddressList()[index].postalCode ??
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
      TextEditingController addressController,
      TextEditingController cityController,
      TextEditingController countryController,
      TextEditingController postalCodeController) {
    if (nameController.text.isEmpty ||
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
      TextEditingController addressController,
      TextEditingController cityController,
      TextEditingController countryController,
      TextEditingController postalCodeController) {
    final model = controller.getAddressData(
        name: nameController.text,
        address: addressController.text,
        city: cityController.text,
        country: countryController.text,
        postalCode: postalCodeController.text);

    controller.addAddressContent(model);
    Get.back();
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

}
