import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/common/common.dart';
import 'package:eshop/ui/shop/controller/ShopController.dart';
import 'package:get/get.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<String> categories = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
      () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _carouselView(ctx: context),
        _pageIndicator(ctx: context),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Text(
            "Categories",
            style: context.toPop18SemiBoldFont(Palette.colorBlack),
          ),
        ),
        SizedBox(height: 8),
        _categoriesView(),
      ]),
    ));
  }

  Widget _categoriesView({BuildContext ctx}) => SizedBox(
        height: 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Palette.colorLightGrey,
                        ),
                        color: (index == 1
                            ? Palette.colorDeepOrangeAccent
                            : Palette.colorWhite),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        categories[index],
                      )),
                    ),
                  ),
                )),
      );

  Widget _carouselView({BuildContext ctx}) => CarouselSlider(
        items: _imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
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
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
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
