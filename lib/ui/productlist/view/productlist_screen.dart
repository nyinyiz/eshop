import 'package:eshop/common/common.dart';
import 'package:eshop/ui/productlist/controller/productlist_controller.dart';
import 'package:get/get.dart';

import '../../shop/view/shop_screen.dart';

class ProductListScreen extends GetView<ProductListController> {
  const ProductListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameter = Get.parameters;
    final type = parameter['type'] ?? '';
    final categoryId = parameter['categoryId'] ?? '';

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "Product List",
            style: context.toPopBoldFont(Palette.colorBlack),
          ),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Men Fashion (50) ${type} and ${categoryId}",
                    style: context.toPop18SemiBoldFont(Palette.colorBlack),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: GridView.builder(
                padding: EdgeInsets.only(bottom: 40, left: 16, right: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.85),
                itemCount: state?.length ?? 0,
                itemBuilder: _popularProductView,
              )),
            ),
          ]),
        ));
  }

  Widget _popularProductView(BuildContext ctx, int index) => GestureDetector(
        onTap: () => {controller.goToProductDetail(index: index)},
        child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 1,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Wrap(
                  children: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            imgList[index],
                            width: MediaQuery.of(ctx).size.width,
                            cacheHeight: 120,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (index == 1 || index == 3),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.colorDeepOrangeAccent),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "30%",
                                  style:
                                      ctx.toPop8RegularFont(Palette.colorWhite),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Text(
                      "Company Name",
                      style: ctx.toPop8SemiBoldFont(Palette.colorGrey),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Summer Sale Special Discount Offer",
                      style: ctx.toPop10RegularFont(Palette.colorBlack),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: " ฿1000",
                              style:
                                  ctx.toPop14RegularFont(Palette.colorBlack)),
                          ((index == 1 || index == 3)
                              ? TextSpan(
                                  text: " ฿1500",
                                  style: ctx
                                      .toPop10RegularFont(
                                          Palette.colorDeepOrangeAccent)
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough))
                              : TextSpan()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
}
