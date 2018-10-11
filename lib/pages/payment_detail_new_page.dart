import 'package:bride_story/models/result_mybooking.dart';
import 'package:bride_story/services/http_services.dart';
import 'package:bride_story/utils/apps_images.dart';
import 'package:bride_story/utils/constant.dart';
import 'package:flutter/material.dart';

class PaymentDetailNew extends StatefulWidget {
  final ResultMyBookingModel bookingModel;

  const PaymentDetailNew({Key key, this.bookingModel}) : super(key: key);
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
    Widget buktiTransferImage() {
      String fileName = widget.bookingModel.getFileNameImage;
      String url = HttpServices.getImageByName +
          kParamImageName.replaceAll('<img>', '$fileName');
      return Card(
        color: Colors.transparent,
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.red, Colors.cyan],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft),
              border: new Border.all(
                  color: Colors.white, width: 2.0, style: BorderStyle.solid),
              borderRadius: new BorderRadius.circular(15.0),
              color: Colors.blue,
              image: new DecorationImage(
                fit: BoxFit.fill,
                // image: new AssetImage('assets/images/2.jpg'),
                image: new NetworkImage(url),
              )),
          // child: imageFromAsset(widget.bookingModel.getFileNameImage),
          // child: Text(''),
          // child: new NetworkImage(url),
        ),
      );
    }

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

    String convertTglBooking(int bookingDate) {
      String displayDate = '';
      int year = new DateTime.fromMillisecondsSinceEpoch(bookingDate).year;
      int month = new DateTime.fromMillisecondsSinceEpoch(bookingDate).month;
      int day = new DateTime.fromMillisecondsSinceEpoch(bookingDate).day;
      displayDate =
          day.toString() + ' ' + _convertBulan(month) + ' ' + year.toString();
      return displayDate;
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
            buktiTransferImage(),
            divider,
            layoutTitleVenue('Nama Tempat : '+ widget.bookingModel.titleVenue),
            layoutTanggalBooking('Tanggal Booking : ' +
                convertTglBooking(widget.bookingModel.dateTimeMilisecond)),
            layoutNamePernikahan(
                'Nama Pernikahan : ' + widget.bookingModel.namaPernikahan),
            layoutNamePenanggungJawab('Nama Penanggung Jawab 1 : ' +
                widget.bookingModel.namaPenanggungJawab1),
            layoutHandPhone1('Handphone 1 : ' + widget.bookingModel.handPhone1),
            layoutPenanggungJawab2('Nama Penanggung Jawab 2 : ' +
                widget.bookingModel.namaPenanggungJawab2),
            layoutHandPhone2('Handphone 2 : ' + widget.bookingModel.handPhone2),
          ],
        ),
      ),
    );
  }
}
