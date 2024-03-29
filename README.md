<h1 align="center">e-Shop</h1>

A simple flutter exercise project that present e-commerce UI and data integration flow with local json data.


## 📸 ScreenShots
<p align="center">
<img src="/screens/e-shop.png" alt="Portrait Screen"/>
</p>


## 📸 Preview

<p align="center">

https://user-images.githubusercontent.com/24582355/170189539-9871db0a-bd10-45bd-a117-2f7d30e00e91.mp4

</p>




## Requirements
- Any Operating System (ie. MacOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter



## Installation

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://flutter.dev/docs/get-started/install).

Once you complete setup, you're ready to test e-Shop.

- `flutter pub get` to fetch any required dependencies.

- `flutter run` to deploy to your connected device or simulator.

  -  `flutter run -d android`
  -  `flutter run -d ios`




## About

A simple flutter exercise project that present e-commerce UI and data integration flow. All of product list and application data will be load from in app json files (such as popular products, categories, today sale events, etc...). Application data will be sync from data layer to presentation layer. Well organized project structure and using clean architecture. 


- The application is only using material design and implemented with their material components.

- In the application, user can explore and order on various categories and sale events.

- There has different product items on different categories. 

- Home page:
  - Category list view.
  - On sale events view.
  - Popular product list and best seller list on home page. (all of products are sync from data layer).
  - Active sale events view.

- Product detail page:
  - Product's photo gallery view.
  - Product's discount % and discount prices.
  - Auto calculation for discount product. 
  - Product's related information and available quantity with out of stock alert.
  - User can post order with specific quantity.
  - Another related product list view on detail page.

- Categories page:
  - Present as a list view of category and their related products by categoriesId.
  - Filter view on product list.

- Notification page.

- Cart page:
  - User's selected product on cart.
  - User can update their product quantity.
  - Show order summary by autocalculate amount.
  - User can choose or create their address. 
  - Order summary confirmation page and delivery information view.

- Profile page:
  - User's account info view.
  - User's ordered list.
  - User's return order list (if order cancel or return).
  - User's saved product list.
  - Addresses view and create form.
  - Application's personalization and user guides. 

- Setup empty view and app network error handler. 

- Some unit testing on loading json data, dependencies binding and application controllers class. 

- All of business logics, their calculation and data synchronization are embedded on mobile application. (no server side implemented.)

<!-- 
*Application tested video show* -->



## Techstack and Open Source libraries

### Build with 
- [Flutter](https://flutter.dev/) - For help getting started with Flutter, view our [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
  - [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook) 

- [Dart](https://dart.dev/) - Dart is a client-optimized language for fast apps on any platform.

- [GetX](https://pub.dev/packages/get) - State manager, navigation manager and dependencies manager.

- [Get-storage](https://pub.dev/packages/get_storage) - A fast, extra light and synchronous key-value in memory, which backs up data to disk at each operation.

- All of dummy photos are load from [Lorem Picsum](https://picsum.photos/) and [LoremFlickr](https://loremflickr.com/).

- Using [8-point grid spacing system](https://styleguide.pivotal.io/concepts/8-point-grid/) on all of application screens.

- Using [Poppins font](https://fonts.google.com/specimen/Poppins?query=popp) for every textview. 


## Project structure

![](/screens/projectstructure.png)



## Contact
If you need any help, you can connect with me.

email: nyinyizaw.dev@gmail.com

 
