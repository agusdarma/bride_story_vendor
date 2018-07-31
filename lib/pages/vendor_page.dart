import 'package:flutter/material.dart';
import '../models/vendor_model.dart';

class VendorPage extends StatefulWidget {
  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  String text = "Loading";
  List<VendorModel> listVendors = new List<VendorModel>();
  // List<DateTime> listVendor = new List<DateTime>();
  // DateTime _tgl;
  // double _opacity;

  /*
for demo hardcode
 */
  void _populateVendorData() {
    listVendors.add(new VendorModel(
        "assets/images/1.jpg", "Michale Buble - Everthing", "Jova Music"));
    listVendors.add(new VendorModel("assets/images/2.jpg",
        "Lately - Stevie Wonders Part 2", "Catering xxx"));
    listVendors.add(new VendorModel("assets/images/3.jpg",
        "Lately - Stevie Wonders Part 3", "Entertainment"));
    listVendors.add(new VendorModel(
        "assets/images/1.jpg", "Lately - Stevie Wonders Part 4", "EO"));
    listVendors.add(new VendorModel(
        "assets/images/2.jpg", "Lately - Stevie Wonders Part 5", "Jova Music"));
    listVendors.add(new VendorModel(
        "assets/images/3.jpg", "Lately - Stevie Wonders Part 6", "Jova Music"));
    listVendors.add(new VendorModel(
        "assets/images/1.jpg", "Michale Buble - Everthing", "Jova Music"));
  }

  // void _populateScheduledData() {
  //   // listBooked.add(new DateTime.now());
  //   listVendor.add(new DateTime(2018, DateTime.july, 22));
  //   listVendor.add(new DateTime(2018, DateTime.july, 21));
  //   listVendor.add(new DateTime(2018, DateTime.july, 28));
  //   listVendor.add(new DateTime(2018, DateTime.july, 29));
  //   // listBooked.add(new DateTime(2018, 29, 6));
  //   // listBooked.add(new DateTime(2018, 28, 6));
  // }

  @override
  void initState() {
    super.initState();
    setState(() {
      _populateVendorData();
      // _populateScheduledData();
      // _tgl = new DateTime.now();
      // _opacity = 0.0;
    });
  }

  void handleNewDate(date) {
    print(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Vendor List"),
          backgroundColor: Colors.redAccent,
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new Container(
                child: new ListView.builder(
                  itemCount: listVendors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return row(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget row(BuildContext context, int index) {
    return new Column(
      children: <Widget>[
        new GestureDetector(
            onTap: () {
              _navigateToVendorDetailPage(context);
            },
            child: new Container(
              height: 150.0,
              margin: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFCCCCCC),
                        const Color(0xFFFFFFFF)
                      ],
                      end: Alignment.topCenter,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.repeated),
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                    fit: BoxFit.none,
                    image:
                        new AssetImage(listVendors.elementAt(index).linkImage),
                  )),
            )),
        new GestureDetector(
            onTap: () {
              _navigateToVendorDetailPage(context);
            },
            child: new Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              alignment: Alignment.topLeft,
              child: new Text(listVendors.elementAt(index).titleVendor,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  )),
            )),
        new GestureDetector(
            onTap: () {
              _navigateToVendorDetailPage(context);
            },
            child: new Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              alignment: Alignment.topLeft,
              child: new Text(listVendors.elementAt(index).vendorName,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  )),
            )),
      ],
    );
  }

  void _navigateToVendorDetailPage(BuildContext context) {
    Navigator.pushNamed(context, "/vendorDetailPage");
  }

  // _openDetailTgl(DateTime tgl) {
  //   setState(() {
  //     _tgl = tgl;
  //     _opacity = 0.0;
  //     for (var i = 0; i < listVendor.length; i++) {
  //       String day = listVendor[i].day.toString();
  //       if (tgl.day.toString() == day) {
  //         _opacity = 1.0;
  //       }
  //     }
  //   });
  // }

  // String _convertBulan(int month) {
  //   String bulan = "";
  //   if (1 == month) {
  //     bulan = "Januari";
  //   } else if (2 == month) {
  //     bulan = "Februari";
  //   } else if (3 == month) {
  //     bulan = "Maret";
  //   } else if (4 == month) {
  //     bulan = "April";
  //   } else if (5 == month) {
  //     bulan = "Mei";
  //   } else if (6 == month) {
  //     bulan = "Juni";
  //   } else if (7 == month) {
  //     bulan = "Juli";
  //   } else if (8 == month) {
  //     bulan = "Agustus";
  //   } else if (9 == month) {
  //     bulan = "September";
  //   } else if (10 == month) {
  //     bulan = "Oktober";
  //   } else if (11 == month) {
  //     bulan = "November";
  //   } else if (12 == month) {
  //     bulan = "Desember";
  //   }
  //   return bulan;
  // }
}
