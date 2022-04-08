import 'package:dartz/dartz.dart' as dartz;
import 'package:eshop/ui/shop/view/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shine/flutter_shine.dart';

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';

part 'fonts.dart';

part 'palette.dart';

part 'screen_size_reducer.dart';

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

Widget categoriesView(BuildContext ctx, int index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            backgroundColor: (index == 0
                ? Palette.colorDeepOrangeAccent
                : Palette.colorWhite)),
        onPressed: () {},
        icon: Icon(
          Icons.computer,
          size: 24.0,
          color: Palette.colorBlack,
        ),
        label: Text(
          categories[index],
          style: ctx.toPop10RegularFont(Palette.colorBlack),
        ),
      ),
    );

Widget popularProductView(BuildContext ctx, int index) => SizedBox(
      width: 120,
      child: Card(
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
/*          decoration: BoxDecoration(
              border: Border.all(
                color: Palette.colorLightGrey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),*/
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
                        cacheHeight: 90,
                        cacheWidth: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (index == 1 || index == 3),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.colorDeepOrangeAccent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "30%",
                            style: ctx.toPop8RegularFont(Palette.colorWhite),
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
                          style: ctx.toPop10SemiBoldFont(Palette.colorBlack)),
                      ((index == 1 || index == 3)
                          ? TextSpan(
                              text: " ฿1500",
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
