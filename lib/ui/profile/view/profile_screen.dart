import 'package:eshop/common/common.dart';
import 'package:eshop/ui/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:switcher_button/switcher_button.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://loremflickr.com/320/240?random=7")))),
              title: Text("Hi, Nyi Nyi",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              subtitle: Text(
                "example@gmail.com",
                style: context.toPop10RegularFont(Palette.colorGrey),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text("Account",
                  style: context
                      .toPop14RegularFont(Palette.colorBlack)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.list_alt_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Orders",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.remove_shopping_cart_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Returns",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.location_on_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Addresses",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text("Personalization",
                  style: context
                      .toPop14RegularFont(Palette.colorBlack)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              enabled: true,
              leading: Container(
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Notification",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: SwitcherButton(
                  value: true,
                  size: 30,
                  onColor: Palette.colorDeepOrangeAccent,
                  onChange: (bool value) {
                    print(value);
                  },
                ),
              ),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.dark_mode_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Preferences",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text("Settings",
                  style: context
                      .toPop14RegularFont(Palette.colorBlack)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.g_translate_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Change Language",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text("Help & Support",
                  style: context
                      .toPop14RegularFont(Palette.colorBlack)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.support_agent_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("Get Help",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.help_outline_outlined,
                  color: Palette.colorBlack,
                  size: 26.0,
                ),
              ),
              title: Text("FAQs",
                  style: context.toPop14RegularFont(Palette.colorBlack)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            Divider(),
            ListTile(
              enabled: true,
              onTap: () => {},
              leading: Container(
                child: Icon(
                  Icons.logout,
                  color: Palette.colorRed,
                  size: 26.0,
                ),
              ),
              title: Text("Log Out",
                  style: context.toPop14RegularFont(Palette.colorRed)),
              trailing: Container(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Palette.colorGrey,
                  size: 16.0,
                ),
              ),
            ),
            SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}
