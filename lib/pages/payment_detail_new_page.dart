import 'package:bride_story/utils/apps_images.dart';
import 'package:bride_story/utils/constant.dart';
import 'package:flutter/material.dart';

class PaymentDetailNew extends StatefulWidget {
  @override
  _PaymentDetailNewState createState() => _PaymentDetailNewState();
}

class _PaymentDetailNewState extends State<PaymentDetailNew> {
  @override
  Widget build(BuildContext context) {
    var header = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 18.0),
          child: Text('Payment Detail',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
    var buktiTransferImage = Card(
      color: Colors.transparent,
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.red, Colors.cyan],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft),
            border: new Border.all(
                color: Colors.white, width: 2.0, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(15.0),
            color: Colors.blue),
        child: imageFromAsset('img1.jpg'),
      ),
    );
    var divider = new Divider(
      height: 2.0,
      color: Colors.black,
    );

    Widget labelDesc(String label) {
      return Text(label);
    }

    Widget layoutNamePernikahan(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                // gradient: new LinearGradient(
                //     colors: [Colors.white, Colors.black],
                //     begin: Alignment.centerRight,
                //     end: Alignment.centerLeft),
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    Widget layoutNamePenanggungJawab(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                // gradient: new LinearGradient(
                //     colors: [Colors.white, Colors.black],
                //     begin: Alignment.centerRight,
                //     end: Alignment.centerLeft),
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    Widget layoutHandPhone1(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                // gradient: new LinearGradient(
                //     colors: [Colors.white, Colors.black],
                //     begin: Alignment.centerRight,
                //     end: Alignment.centerLeft),
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    Widget layoutPenanggungJawab2(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    Widget layoutHandPhone2(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    Widget layoutTitleVenue(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    Widget layoutTanggalBooking(String label) {
      return Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
            padding: EdgeInsets.all(5.0),
            height: 30.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: new Border.all(
                    color: Colors.black, width: 2.0, style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.white),
            child: Center(
              child: labelDesc(label),
            )),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: header,
        ),
        body: new Column(
          children: <Widget>[
            buktiTransferImage,
            divider,
            layoutTitleVenue('Nama Tempat : Balai Samudra'),
            layoutTanggalBooking('Tanggal Booking : 23 Oktober 2018'),
            layoutNamePernikahan('Nama Pernikahan : Agus Darma Kusuma'),
            layoutNamePenanggungJawab('Nama Penanggung Jawab 1 : Budi anto'),
            layoutHandPhone1('Handphone 1 : 08569439349339'),
            layoutPenanggungJawab2('Nama Penanggung Jawab 2 : Budi'),
            layoutHandPhone2('Handphone 2 : 081292929292'),
          ],
        ),
      ),
    );
  }
}
