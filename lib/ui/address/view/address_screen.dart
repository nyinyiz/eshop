import 'package:eshop/common/common.dart';
import 'package:eshop/ui/address/controller/address_controller.dart';
import 'package:get/get.dart';

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: controller.obx((state) => Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => {},
                    child: const Text('Add new Address'),
                  ),
                ),
                Expanded(child:
                Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Palette.colorLightGrey,
                    ),
                      shrinkWrap: false,
                      itemCount: state?.length ?? 0,
                      itemBuilder: _notificationView),
                ))
              ],
            ),
          )),
    );
  }

  Widget _notificationView(BuildContext context, int index) => Container(
    child: Text("This is new address" ),
  );
}
