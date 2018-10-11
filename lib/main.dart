import 'package:bride_story/pages/attachment_page.dart';
import 'package:bride_story/pages/home_page.dart';
import 'package:bride_story/pages/list_payment_page.dart';
import 'package:bride_story/pages/login_page.dart';
import 'package:bride_story/pages/login_page_new.dart';
import 'package:bride_story/pages/payment_detail_page.dart';
import 'package:bride_story/pages/payment_page.dart';
import 'package:bride_story/pages/schedule_page.dart';
import 'package:bride_story/pages/vendor_detail_page.dart';
import 'package:bride_story/pages/vendor_page.dart';
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(new MyApp());
void main() {
// Create the router.
  Router router = new Router();

  // Define our home page.
  router.define('/homePage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));

  // Define our schedule page.
  router.define('/schedulePage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SchedulePage();
  }));

  // Define our vendor page.
  router.define('/vendorPage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new VendorPage();
  }));

  // Define our vendor detail page.
  router.define('/vendorDetailPage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new VendorDetailPage();
  }));

  // Define our payment page.
  router.define('/paymentPage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new PaymentPage();
  }));

  // Define our attachment page.
  router.define('/attachmentPage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AttachmentPage();
  }));

  // Define our payment page.
  router.define('/listPaymentPage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ListPaymentPage();
  }));

  // Define our payment page.
  router.define('/loginPage', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new LoginPage();
  }));


  // initSharedPreferences();

  runApp(new MyApp(router: router));
}

// void initSharedPreferences() {
//   print("init shared preferences running");
//   String filterParamJson =
//       '{"categoryName":"All Categories","countryName":"Indonesia","cityName":"Jakarta"}';
//   saveCategoryNameInSharedPreferences(filterParamJson, keyFilterParam);
// }

// void saveCategoryNameInSharedPreferences(
//     String categoryName, String key) async {
//   print("aaaa");
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString(key, categoryName);
// }

class MyApp extends StatelessWidget {
  final Router router;
  MyApp({Key key, @required this.router}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bride Vendor",
      theme: new ThemeData(      
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      onGenerateRoute: router.generator,
    );
  }
}
