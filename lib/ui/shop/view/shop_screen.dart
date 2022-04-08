import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/common/common.dart';
import 'package:eshop/ui/shop/controller/shop_controller.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:get/get.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

List<String> imgList = [
  'https://loremflickr.com/320/240/paris,fashion/all',
  'https://loremflickr.com/320/240/paris,dress/all',
  'https://loremflickr.com/320/240/jacket/all',
  'https://loremflickr.com/320/240/swimwear/all',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<String> categories = [
  "All",
  "Phone",
  "Laptop",
  "Computer",
  "Book",
  "Monitor",
  "Mouse",
  "Keyboard"
];

class ShopScreen extends GetView<ShopController> {
  final CarouselController _controller = CarouselController();

  final String title;

  ShopScreen(this.title);

  Duration _duration = Duration(seconds: 100000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(children: [
            /** Carousel Image slider view*/
            _carouselView(ctx: context),

            /** Carousel Image pager navigator view*/
            _pageIndicator(ctx: context),

            /** Categories List view with title */
            SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Text(
                "Categories",
                style: context.toPop18SemiBoldFont(Palette.colorBlack),
              ),
            ),
            SizedBox(height: 8),
            _buildCategories(),

            /** Popular product List view with title */
            SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Product",
                    style: context.toPop18SemiBoldFont(Palette.colorBlack),
                  ),
                  TextButton(
                    child: Text(
                      "See all",
                      style: context.toPop14RegularFont(Palette.colorBlue),
                    ),
                    onPressed: () {
                      controller.goToProductList(index: 0, type: 0);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            _popularProductList(),

            /** Flash sale UI view with list and card */
            SizedBox(height: 16),
            _flashSaleCard(ctx: context),
            SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Flash sale",
                    style: context.toPop18SemiBoldFont(Palette.colorBlack),
                  ),
                  TextButton(
                    child: Text(
                      "See all",
                      style: context.toPop14RegularFont(Palette.colorBlue),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            _popularProductList(ctx: context),

            /** Event sale card view*/
            SizedBox(height: 16),
            saleEventView(
                ctx: context, imgURL: "https://loremflickr.com/320/240/nike"),
            saleEventView(
                ctx: context, imgURL: "https://loremflickr.com/320/240/adidas"),
            saleEventView(
                ctx: context, imgURL: "https://loremflickr.com/320/240/paris"),

            /** Best seller product List view with title */
            SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best sellers",
                    style: context.toPop18SemiBoldFont(Palette.colorBlack),
                  ),
                  TextButton(
                    child: Text(
                      "See all",
                      style: context.toPop14RegularFont(Palette.colorBlue),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            _popularProductList(),
            SizedBox(height: 100),
          ]),
        ),
      )),
    );
  }

  Widget _flashSaleCard({BuildContext ctx}) => Card(
        margin: EdgeInsets.symmetric(horizontal: 16),
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 16,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://loremflickr.com/320/240?random=${Random().nextInt(10)}",
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(ctx).size.width,
            ),
            Align(
              alignment: Alignment.center,
              child: FlutterShine(
                light: Light(intensity: 1),
                builder: (BuildContext context, ShineShadow shineShadow) {
                  return Column(
                    children: [
                      Text(
                        "Super Flash Sale 50% OFF",
                        style: ctx.toPop32RegularFont(Palette.colorWhite),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SlideCountdownClock(
                          duration: _duration,
                          slideDirection: SlideDirection.Up,
                          separator: "-",
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          separatorTextStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Palette.colorBlue, shape: BoxShape.circle),
                          onDone: () {
                            Get.snackbar("Hi", "Clock 1 finish");
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );

  /* Widget _saleEventViewList({BuildContext ctx}) => SizedBox(
    height: 300,
    child: ListView.builder(
        itemCount: imgList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: saleEventView),
  );*/

  Widget _popularProductList({BuildContext ctx}) => SizedBox(
        height: 170,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: imgList.length,
            itemBuilder: popularProductView),
      );

  Widget _buildCategories({BuildContext ctx}) => SizedBox(
        height: 35,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: categoriesView,
        ),
      );

  Widget _carouselView({BuildContext ctx}) => CarouselSlider(
        items: _imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 3.0,
            onPageChanged: (index, reason) {
              controller.changeTabIndex(index);
            }),
      );

  Widget _pageIndicator({BuildContext ctx}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 4.0,
              height: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(ctx).brightness == Brightness.dark
                          ? Palette.colorWhite
                          : Palette.colorBlack)
                      .withOpacity(
                          controller.getTabIndex() == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      );

  List<Widget> _imageSliders = imgList
      .map((item) => Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();
}
