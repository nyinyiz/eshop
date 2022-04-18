import 'dart:math';

import 'package:eshop/common/common.dart';
import 'package:eshop/ui/productlist/controller/productlist_controller.dart';
import 'package:get/get.dart';

import '../../shop/view/shop_screen.dart';

class ProductListScreen extends GetView<ProductListController> {
  const ProductListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameter = Get.parameters;
    final type = parameter['type'] ?? '0';
    final categoryId = parameter['categoryId'] ?? '0';

    controller.getProductListByType(int.parse(type));

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            controller.state[index].images[0]+Random().nextInt(9).toString() ?? "",
                            width: MediaQuery.of(ctx).size.width,
                            height: 100,
                            cacheHeight: 120,
                            cacheWidth: 120,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.state[index].discountPercent != 0,
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
                                  controller.state[index].discountPercent.toString() + "%" ?? "0%",
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
                      controller.state[index].brand.name ?? "Company Name",
                      style: ctx.toPop8SemiBoldFont(Palette.colorGrey),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controller.state[index].title ?? "Title",
                      style: ctx.toPop10RegularFont(Palette.colorBlack),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "฿${getDiscountPrice(controller.state[index])}",
                              style:
                                  ctx.toPop14RegularFont(Palette.colorBlack)),
                          ((controller.state[index].discountPercent != 0)
                              ? TextSpan(
                                  text: " ฿${controller.state[index].price}",
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
