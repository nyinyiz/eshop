import 'package:eshop/ui/common/common.dart';

class ShopScreen extends StatefulWidget {
  final String title;

  ShopScreen(this.title);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.title,
        style: context.toPop32RegularFont(Palette.colorBlack),
      ),
    );
  }
}
