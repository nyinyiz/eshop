import 'package:eshop/common/common.dart';
import 'package:eshop/ui/notification/controller/notification_controller.dart';
import 'package:eshop/ui/notification/view/notification_tiles.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Notifications",
          style: context.toPopBoldFont(Palette.colorBlack),
        ),
        centerTitle: true,
      ),
      body: controller.obx((state) => Container(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Palette.colorLightGrey,
                    ),
                padding:
                    EdgeInsets.only(bottom: 32, top: 16, left: 16, right: 16),
                shrinkWrap: false,
                itemCount: state?.length ?? 0,
                itemBuilder: (context, index) {
                  return NotificationTiles(
                    title: controller.state[index].title ?? "E-Shop",
                    subtitle: controller.state[index].description ??
                        'Thanks for download E-Commerce app.',
                    enable: true,
                    onTap: () => Get.bottomSheet(
                      SingleChildScrollView(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              controller.state[index].title ?? "E-Shop",
                              style: context
                                  .toPop18SemiBoldFont(Palette.colorBlack),
                            ),
                            SizedBox(height: 16),
                            Text(
                              controller.state[index].description ?? "This is notification description",
                              style:
                                  context.toPop10RegularFont(Palette.colorGrey),
                            ),
                            SizedBox(height: 16),
                            OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Close'),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
