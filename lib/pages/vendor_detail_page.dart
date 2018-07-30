import 'package:bride_story/pages/webview_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class VendorDetailPage extends StatefulWidget {
  @override
  _VendorDetailPageState createState() => _VendorDetailPageState();
}

class _VendorDetailPageState extends State<VendorDetailPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget socialMedia = new Container(
      padding: EdgeInsets.all(5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text("Social Media", style: TextStyle(fontSize: 14.0)),
          new Expanded(
            child: new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(right: 5.0),
                    child: new Icon(Icons.polymer),
                  ),
                  new Container(
                      padding: EdgeInsets.only(right: 5.0),
                      child: new Icon(Icons.card_giftcard)),
                ],
              ),
            ),
          )
        ],
      ),
    );

    Widget banner = new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 140.0, 0.0, 0.0),
      child: new Container(
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                // topLeft: Radius.circular(15.0),
                // bottomRight: Radius.circular(15.0)
                ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(6.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Michael Bubble - Everything',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              new Text(
                'Jova Music',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              new Text(
                'Venue',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          )),
      // ),
      //  ),
    );

    Widget projectImages = new Container(
      width: screenWidth,
      height: 200.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/2.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/3.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/4.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/2.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/1.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/2.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/3.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/1.jpg"),
                      ))),
              banner,
            ],
          ),
          new Stack(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(right: 5.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/images/4.jpg"),
                      ))),
              banner,
            ],
          )
        ],
      ),
    );

    Widget projectRow = new Container(
      padding: EdgeInsets.all(12.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text("Projects", style: TextStyle(fontSize: 14.0)),
          new GestureDetector(
            child: new Text("View All (5) >", style: TextStyle(fontSize: 14.0)),
            onTap: () {
              _navigateProjectListPage(context);
            },
          )
        ],
      ),
    );

    Widget buttons = new Container(
      padding: EdgeInsets.all(10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new GestureDetector(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.call),
                new Text("Call", style: TextStyle(fontSize: 14.0)),
              ],
            ),
            onTap: () {
              _navigateCallAction(context);
            },
          ),
          new Container(
            height: 30.0,
            width: 1.0,
            color: Colors.black,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          new GestureDetector(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.image),
                new Text("4D", style: TextStyle(fontSize: 14.0)),
              ],
            ),
            onTap: () {
              _navigateTo4DPage(context);
            },
          ),
          new Container(
            height: 30.0,
            width: 1.0,
            color: Colors.black,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          new GestureDetector(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.attach_money),
                new Text("Price List", style: TextStyle(fontSize: 14.0)),
              ],
            ),
            onTap: () {
              _navigateToPriceListPage(context);
            },
          ),
          new Container(
            height: 30.0,
            width: 1.0,
            color: Colors.black,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          new GestureDetector(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.calendar_today),
                new Text("Booking Date", style: TextStyle(fontSize: 14.0)),
              ],
            ),
            onTap: () {
              _navigateToBookingPage(context);
            },
          )
        ],
      ),
    );

    Widget txtOnline = new Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      child: new Text("Active 11 days ago.", style: TextStyle(fontSize: 14.0)),
    );

    Widget bgImage = new Container(
      height: screenHeight / 3,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
          filter: new ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
          )),
    );

    Widget roundedImage = new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          height: 50.0,
        ),
        Center(
          child: new Container(
              margin: EdgeInsets.only(right: 5.0),
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage("assets/images/2.jpg"),
                  ))),
        ),
        new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: new Center(
              child: Text(
                "Port Love Creative Studio 2",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            )),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(right: 2.0),
                child: new Center(
                  child: Text(
                    "Hair & Makeup",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                )),
            new Container(
                padding: EdgeInsets.only(right: 2.0),
                child: new Center(
                  child: Text(
                    "Jakarta,",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                )),
            new Container(
                padding: EdgeInsets.only(right: 2.0),
                child: new Center(
                  child: Text(
                    "Indonesia",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                )),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.star,
              color: Colors.white,
            ),
            new Icon(
              Icons.star,
              color: Colors.white,
            ),
            new Icon(
              Icons.star,
              color: Colors.white,
            ),
            new Icon(
              Icons.star,
              color: Colors.white,
            ),
            new Container(
                padding: EdgeInsets.only(right: 2.0),
                child: new Center(
                  child: Text(
                    "32",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                )),
            new Container(
                padding: EdgeInsets.only(right: 2.0),
                child: new Center(
                  child: Text(
                    "reviews",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                )),
          ],
        ),
      ],
    );

    return SafeArea(
      child: new Scaffold(
          appBar: AppBar(
            title: new TextField(
              decoration: new InputDecoration(
                  hintText: "Search Vendors, Articles Here"),
            ),
          ),
          body: new ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  bgImage,
                  roundedImage,
                ],
              ),
              txtOnline,
              new Divider(
                color: Colors.black,
                height: 2.0,
              ),
              buttons,
              new Divider(
                color: Colors.black,
                height: 2.0,
              ),
              projectRow,
              new Divider(
                color: Colors.black,
                height: 2.0,
              ),
              projectImages,
              socialMedia,
            ],
          )),
    );
  }

  void _navigateToPriceListPage(BuildContext context) {
    Navigator.pushNamed(context, "/priceListPage");
  }

  void _navigateTo4DPage(BuildContext context) {
    // Navigator.pushNamed(context, "/webViewPage");
    Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new WebviewPage(url: "https://roundme.com/tour/291549/view/919147/", )),
            );
  }

  void _navigateCallAction(BuildContext context) {
    UrlLauncher.launch("tel:+6285693938630");
  }

  void _navigateProjectListPage(BuildContext context) {
    Navigator.pushNamed(context, "/projectListPage");
  }

  void _navigateToBookingPage(BuildContext context) {
    Navigator.pushNamed(context, "/bookingPage");
  }
}
