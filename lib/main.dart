import 'package:eshop/route/app_pages.dart';
import 'package:eshop/ui/common/common.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(color: Colors.black),
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
