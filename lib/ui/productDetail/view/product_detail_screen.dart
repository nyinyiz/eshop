import 'package:eshop/common/common.dart';
import 'package:eshop/ui/productDetail/controller/product_detail_controller.dart';
import 'package:eshop/ui/shop/view/shop_screen.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameter = Get.parameters;
    final productId = parameter['id'] ?? '';

    return controller.obx(
      (state) => Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _flashSaleCard(ctx: context),
              SizedBox(
                height: 16,
              ),
              _productImageList(context: context),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Company Name",
                  style: context.toPop18SemiBoldFont(Palette.colorGrey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Summer Sale Special Discount Offer ${controller.getProductDetail(productId).title}",
                  style: context.toPop28RegularFont(Palette.colorBlack),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Product info",
                  style: context
                      .toPop14RegularFont(Palette.colorBlack)
                      .copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  controller.getProductDetail(productId).description ??
                      "This is description text trust me. But now it was error. You dun't know about null right xD.",
                  style: context.toPop14RegularFont(Palette.colorGrey),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 24.0,
                      color: Palette.colorBlack,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Shipping information",
                      style: context
                          .toPop14RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "STANDARD SHIPPING 22THB. FREE on orders about 100THB. Estimated to be delivered on 18/05/2022-21/05/2022",
                  style: context.toPop14RegularFont(Palette.colorGrey),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_return_outlined,
                      size: 24.0,
                      color: Palette.colorBlack,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Return Policy",
                      style: context
                          .toPop14RegularFont(Palette.colorBlack)
                          .copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SelectableLinkify(
                  onOpen: (link) => print("Clicked ${link.url}!"),
                  text:
                      "https://www.termsfeed.com/blog/sample-return-policy-ecommerce-stores/",
                  style: context.toPop14RegularFont(Palette.colorBlue),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(),

              /** You May Also Like product List view with title */
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "You May Also Like",
                      style: context.toPop18SemiBoldFont(Palette.colorBlack),
                    ),
                    TextButton(
                      child: Text(
                        "See all",
                        style: context.toPop14RegularFont(Palette.colorBlue),
                      ),
                      onPressed: () {
                        // controller.goToProductList(index: 0, type: 0);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              _popularProductList(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          child: Container(
              margin: EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  " ฿${controller.getDiscountPrice(productId)}",
                              style: context
                                  .toPop32RegularFont(Palette.colorBlack)),
                          TextSpan(
                              text:
                                  "  ฿${controller.getProductDetail(productId).price}",
                              style: context
                                  .toPop14RegularFont(
                                      Palette.colorDeepOrangeAccent)
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ), // foreground
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: context.toPop18SemiBoldFont(Palette.colorWhite),
                      ),
                    ),
                  ))
                ],
              )),
        ),
      ),
    );
  }

  Widget _popularProductList({BuildContext ctx}) => SizedBox(
        height: 170,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: imgList.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () => {
                    Get.offAndToNamed(
                      '/home/category/productlist/productdetail?id=$index',
                    )
                    // controller.goToProductDetail(index: index)
                  },
                  child: popularProductView(
                      ctx: context,
                      product: controller.getProductDetail(index.toString())),
                )),
      );

  Widget _productImageList({BuildContext context}) => SizedBox(
        height: 50,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: imgList.length,
            itemBuilder: _productImageView),
      );

  Widget _productImageView(BuildContext context, int index) => GestureDetector(
        onTap: () => {controller.changeImageIndex(index)},
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 4),
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Palette.colorGreen,
                width: (controller.getImageIndex() == index) ? 2 : 0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            imgList[index],
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
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
          imgList[controller.getImageIndex()],
          fit: BoxFit.cover,
          height: MediaQuery.of(ctx).size.height * 0.35,
          width: MediaQuery.of(ctx).size.width,
        ),
      );
}
