import 'dart:math';

import 'package:eshop/common/common.dart';
import 'package:eshop/ui/productDetail/controller/product_detail_controller.dart';
import 'package:eshop/ui/shop/view/shop_screen.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameter = context.params; //Get.parameters;
    final productId = parameter['id'] ?? '';

    return Obx(
      () => Scaffold(
        backgroundColor: Palette.colorWhite,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _flashSaleCard(ctx: context),
              SizedBox(height: 16,),
              _productImageList(context: context),
              SizedBox(height: 16,),
              Text("This Is Detail ${controller.getProductDetail(productId).title}")

            ],
          ),
        ),
      ),
    );
  }

  Widget _productImageList({BuildContext context}) => SizedBox(
    height: 50,
    child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: imgList.length,
        itemBuilder: _productImageView),
  );


  Widget _productImageView(BuildContext context, int index) => Card(
    margin: EdgeInsets.symmetric(horizontal: 4),
    semanticContainer: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: 0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.network(
      "https://loremflickr.com/320/240?random=${Random().nextInt(10)}",
      fit: BoxFit.cover,
      height: 50,
      width: 50,
    ),
  );

  Widget _flashSaleCard({BuildContext ctx}) => Card(
    margin: EdgeInsets.symmetric(horizontal: 16),
    semanticContainer: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: 0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.network(
      "https://loremflickr.com/320/240?random=${Random().nextInt(10)}",
      fit: BoxFit.cover,
      height: MediaQuery.of(ctx).size.height * 0.35,
      width: MediaQuery.of(ctx).size.width,
    ),
  );


}
