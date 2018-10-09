import 'dart:async';
import 'dart:convert';

import 'package:bride_story/data/filter_param.dart';
import 'package:bride_story/models/result_mybooking.dart';
import 'package:bride_story/models/venue_model.dart';
import 'package:bride_story/pages/login_page_new.dart';
import 'package:bride_story/pages/webview_page.dart';
import 'package:bride_story/services/http_services.dart';
import 'package:bride_story/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPaymentPage extends StatefulWidget {
  ListPaymentPage({Key key}) : super(key: key);

  @override
  _ListPaymentPageState createState() => _ListPaymentPageState();
}

class _ListPaymentPageState extends State<ListPaymentPage> {
  _ListPaymentPageState();
  final formatter = new NumberFormat("#,###");

  String text = "Loading";
  List<ResultMyBookingModel> listPaymentData = new List<ResultMyBookingModel>();
  int selectedDate = new DateTime.now().millisecondsSinceEpoch;
  String displayedDate = "";
  String countSearch = "0";

  FilterParam parameter;

  // void _populateResultData(List<dynamic> listPayment) {
  //   for (var items in listPayment) {
  //     Map venue = items; //store each map
  //     Map venue2 = venue['venue'];
  //     List<dynamic> listBookingDate = venue['listBookingDates'];      
  //     ResultMyBookingModel a = new ResultMyBookingModel
  //     ('andika', 'budi', '085693939393', 'sasa', '0856939393', 'admin@gmail.com', 'Balai', 1536771600000, 1, 'a@gmail.com');
  //     listPaymentData.add(a);
  //   }
  // }

  void _populateResultData(List<dynamic> listPayment) {
    for (var items in listPayment) {
      Map venue = items; //store each map
      Map venue2 = venue['venueVO'];
      Map venue3 = venue2['venue'];
      Map bookingDateVO = venue['bookingDateVO'];
      String namaPernikahan = bookingDateVO['namaPernikahan'];
      String namaPenanggungJawab1 = bookingDateVO['namaPenanggungJawab1'];
      String handPhone1 = bookingDateVO['handPhone1'];
      String namaPenanggungJawab2 = bookingDateVO['namaPenanggungJawab2'];
      String handPhone2 = bookingDateVO['handPhone2'];
      String userEmailBooking = bookingDateVO['userEmailBooking'];    
      String titleVenue = venue3['titleVenue'];    
      int dateTime = bookingDateVO['dateTime'];
      int idBooking = bookingDateVO['id'];    
      
      ResultMyBookingModel a = new ResultMyBookingModel
      (namaPernikahan, namaPenanggungJawab1, handPhone1, namaPenanggungJawab2, handPhone2, userEmailBooking
      , titleVenue, dateTime, idBooking, parameter.email);
      listPaymentData.add(a);
      // ResultMyBookingModel b = new ResultMyBookingModel
      // ('andika2', 'budi2', '085693939393', 'sasa2', '0856939393', 'admin2@gmail.com', 'Balai2', 1536771600000, 1, 'a@gmail.com');
      // listPaymentData.add(b);
    }
  }

  void _updateBookingDate(List<VenueModel> listVenue) {
    for (var items in listVenue) {      
    }
  }

  Future<String> _getFilterParam(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = (prefs.getString(key) ?? "");
    // print("get from shared Preferenced " + json);
    return json;
  }

  String _convertBulan(int month) {
    String bulan = "";
    if (1 == month) {
      bulan = januari;
    } else if (2 == month) {
      bulan = februari;
    } else if (3 == month) {
      bulan = maret;
    } else if (4 == month) {
      bulan = april;
    } else if (5 == month) {
      bulan = mei;
    } else if (6 == month) {
      bulan = juni;
    } else if (7 == month) {
      bulan = juli;
    } else if (8 == month) {
      bulan = agustus;
    } else if (9 == month) {
      bulan = september;
    } else if (10 == month) {
      bulan = oktober;
    } else if (11 == month) {
      bulan = november;
    } else if (12 == month) {
      bulan = desember;
    }
    return bulan;
  }

  Future<String> getLoginDataSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = "";
    json = (prefs.getString(key) ?? "");
    print("getLoginDataSharedPreferences " + json);
    return json;
  }

  @override
  void initState() {
    super.initState();
    getLoginDataSharedPreferences(keyLoginParam).then((String json) {
      const JsonDecoder decoder = const JsonDecoder();
      Map loginParamVO = decoder.convert(json);
      String sessionData = loginParamVO['sessionData'];
      String email = loginParamVO['email'];
      int sessionDate = loginParamVO['sessionDate'];
      int timeOutLogin = loginParamVO['timeOutLoginSetting'];
      // String phoneNo = loginParamVO['phoneNo'];
      // String password = loginParamVO['password'];
      if (sessionData.isEmpty) {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => new LoginPage()),
        );
      } else {
        DateTime currentTime = new DateTime.now();
        DateTime sessionTime = DateTime.fromMillisecondsSinceEpoch(sessionDate);
        print(currentTime);
        print(sessionTime);
        print(currentTime.difference(sessionTime).inSeconds);
        if (currentTime.difference(sessionTime).inSeconds > timeOutLogin) {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new LoginPage()),
          );
        } else {
          parameter = new FilterParam('', 0, '', 0, '', 0, null);
          parameter.setEmail = email;
          allPaymentWithUserLogin(parameter);
          // _populateResultData();
        }
      }
    });    
    // _populateResultData();
    setState(() {
      displayedDate = '28 Agustus 2018';      
    });
  }

  void allPaymentWithUserLogin(FilterParam param) {
    print('Parameter ' + param.email);
    HttpServices http = new HttpServices();
    const JsonEncoder encoder = const JsonEncoder();
    String parameterJson = encoder.convert(param);
    http.getListPaymentByUser(parameterJson).then((List<dynamic> listVenue) {
      setState(() {
        if (listVenue.length > 0) {
          _populateResultData(listVenue);
          countSearch = listVenue.length.toString();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var header = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Text('List Payment',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(countSearch + ' available payment',
              style: TextStyle(
                fontSize: 12.0,
              )),
        )
      ],
    );    

    Future<Null> _selectDate(
        BuildContext context, List<VenueModel> listVenueData) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2015, 8),
          lastDate: new DateTime(2101));
      if (picked != null) {
        setState(() {
          selectedDate = picked.millisecondsSinceEpoch;
          int year = new DateTime.fromMillisecondsSinceEpoch(selectedDate).year;
          int month =
              new DateTime.fromMillisecondsSinceEpoch(selectedDate).month;
          int day = new DateTime.fromMillisecondsSinceEpoch(selectedDate).day;
          displayedDate = day.toString() +
              ' ' +
              _convertBulan(month) +
              ' ' +
              year.toString();
          parameter.bookingDate = selectedDate;
          _updateBookingDate(listVenueData);
          // print(listVenueData);
        });
      }
    }

    // var selectedDateView = Container(
    //   width: MediaQuery.of(context).size.width,
    //   child: Material(
    //       elevation: 4.0,
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(4.0),
    //       child: InkWell(
    //         onTap: () {
    //           // _navigateAndDisplaySelection(context);
    //           _selectDate(context, listPaymentData);
    //         },
    //         child: Padding(
    //           padding: EdgeInsets.all(12.0),
    //           child: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               Icon(Icons.date_range),
    //               Padding(padding: EdgeInsets.only(right: 16.0)),
    //               Expanded(
    //                 child: new Text(displayedDate,
    //                     style: TextStyle(
    //                       fontSize: 13.0,
    //                     )),
    //               ),
    //               Text('Changes',
    //                   style: TextStyle(
    //                       color: Colors.blue,
    //                       fontSize: 12.0,
    //                       fontStyle: FontStyle.italic)),
    //             ],
    //           ),
    //         ),
    //       )),
    // );

    // Widget imageVenue(BuildContext context, int index) {
    //   String fileName = listPaymentData.elementAt(index).linkImageVenue;
    //   String url = HttpServices.getImageByName +
    //       kParamImageName.replaceAll('<img>', '$fileName');
    //   return new Container(
    //       margin: EdgeInsets.only(right: 5.0),
    //       width: 140.0,
    //       height: 200.0,
    //       decoration: new BoxDecoration(
    //           shape: BoxShape.rectangle,
    //           image: new DecorationImage(
    //             fit: BoxFit.fill,
    //             // image: new AssetImage('assets/images/' +
    //             //     listVenueData.elementAt(index).linkImageVenue),
    //             image: new NetworkImage(url),
    //           )));
    // }

    Widget descVenue(BuildContext context, int index) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 4.0, bottom: 5.0),
              child: Text(listPaymentData.elementAt(index).titleVenue,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  )),
            ),
            Row(
              children: <Widget>[
                Text('Tanggal Pernikahan : '),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 4.0, bottom: 2.0),
                    child: Text(listPaymentData.elementAt(index).handPhone1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ),
                ),
              ],
            ), 
            Row(
              children: <Widget>[
                Text('Nama Pernikahan :'),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 4.0, bottom: 2.0),
                    child: Text(listPaymentData.elementAt(index).namaPernikahan,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Nama Penanggung Jawab : '),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 4.0, bottom: 2.0),
                    child: Text(listPaymentData.elementAt(index).namaPenanggungJawab1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Handphone 1 : '),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 4.0, bottom: 2.0),
                    child: Text(listPaymentData.elementAt(index).handPhone1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ),
                ),
              ],
            ),            
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     Container(
            //       padding: EdgeInsets.only(left: 4.0, top: 30.0, right: 10.0),
            //       child: Text('Rp.' + listPaymentData.elementAt(index).namaPenanggungJawab2,
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 18.0,
            //           )),
            //     ),
            //   ],
            // )
          ],
        ),
      );
    }

    void _navigateTo4DPage(BuildContext context, VenueModel venueModel) {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new WebviewPage(
                  url: venueModel.url4d,
                )),
      );
    }

    

    Widget content(BuildContext context, int index) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 9.0, right: 9.0),
        margin: EdgeInsets.only(top: 5.0, bottom: 6.0),
        child: Material(
            elevation: 4.0,
            color: Colors.white70,
            // color: listPaymentData.elementAt(index).isDayFlag == 1 &&
            //         listPaymentData.elementAt(index).isNightFlag == 1
            //     ? Colors.grey[300]
            //     : Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            child: InkWell(
              onTap: () {
                // _navigateVendorPage(context, listVenueData.elementAt(index));
                // _navigateTo4DPage(context, listPaymentData.elementAt(index));
              },
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text((index+1).toString()),
                    // imageVenue(context, index),
                    descVenue(context, index),                    
                  ],
                ),
              ),
            )),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: header,
        ),
        body: Column(
          children: <Widget>[
            // selectedDateView,
            new Expanded(
              child: new Container(
                child: new ListView.builder(
                  itemCount: listPaymentData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return content(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
