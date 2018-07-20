import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(new MyApp());
void main() {
// Create the router.
  Router router = new Router();

  // Define our home page.
  // router.define('/', handler: new Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //   return new HomePageLayout();
  // }));

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
      title: "lblTitleApplication",
      theme: new ThemeData(
        // primarySwatch: Colors.red,
        // primaryColor: kTelkomselRed,
        fontFamily: 'Roboto',
      ),
      // home: HomePageLayout(),
      onGenerateRoute: router.generator,
    );
  }
}
