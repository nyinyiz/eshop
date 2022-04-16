import 'package:dartz/dartz.dart' as dartz;
import 'package:eshop/domain/models/home_data.dart';
import 'package:eshop/domain/models/product_model.dart';
import 'package:eshop/ui/shop/view/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';

part 'fonts.dart';

part 'palette.dart';

part 'screen_size_reducer.dart';

String getBaht() => "฿";

Widget saleEventView({BuildContext ctx, String imgURL}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        elevation: 4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              imgURL,
              fit: BoxFit.cover,
              height: 150,
              width: MediaQuery.of(ctx).size.width,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 50),
                child: Column(
                  children: [
                    Text(
                      "NEW ARRIVAL SPECIAL OFFER FOR APRIL",
                      style: ctx.toBeba64RegularFont(Palette.colorWhite),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.navigate_next, color: Palette.colorBlack),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(8),
                  primary: Colors.white70,
                  onPrimary: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget popularProductView({BuildContext ctx, DataProduct product}) => SizedBox(
      width: 120,
      child: Card(
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
                        product.images[0],
                        cacheHeight: 90,
                        cacheWidth: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (product.discountPercent != 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.colorDeepOrangeAccent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.discountPercent.toString() + "%" ?? "30%",
                            style: ctx.toPop8RegularFont(Palette.colorWhite),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                Text(
                  product.brand.name ?? "Company Name",
                  style: ctx.toPop8SemiBoldFont(Palette.colorGrey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.title ?? "Summer Sale Special Discount Offer",
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
                          text: " ฿${getDiscountPrice(product)}",
                          style: ctx.toPop10SemiBoldFont(Palette.colorBlack)),
                      ((product.discountPercent != 0)
                          ? TextSpan(
                              text: " ฿${product.price}",
                              style: ctx
                                  .toPop8RegularFont(
                                      Palette.colorDeepOrangeAccent)
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough))
                          : TextSpan()),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );

String getDiscountPrice(DataProduct product) {
  if (product.discountPercent.isBlank || product.discountPercent.isEqual(0)) {
    return product.price;
  } else {
    final totalPrice = int.parse(product.price) -
        _getDiscountAmount(int.parse(product.price), product.discountPercent);

    return totalPrice.toString();
  }
}

_getDiscountAmount(int price, int percent) => price * percent / 100;
