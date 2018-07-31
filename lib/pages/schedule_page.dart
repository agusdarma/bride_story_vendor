import 'package:bride_story/plugins/calendar/lib/flutter_calendar.dart';
import 'package:flutter/material.dart';
import 'schedule_detail_page.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<DateTime> listScheduled = new List<DateTime>();
  DateTime _tgl;
  double _opacity;

  void _populateScheduledData() {
    // listBooked.add(new DateTime.now());
    listScheduled.add(new DateTime(2018, DateTime.july, 22));
    listScheduled.add(new DateTime(2018, DateTime.july, 21));
    listScheduled.add(new DateTime(2018, DateTime.july, 28));
    listScheduled.add(new DateTime(2018, DateTime.july, 29));
    // listBooked.add(new DateTime(2018, 29, 6));
    // listBooked.add(new DateTime(2018, 28, 6));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _populateScheduledData();
      _tgl = new DateTime.now();
      _opacity = 0.0;
    });
  }

  void handleNewDate(date) {
    print(date);
  }

  @override
  Widget build(BuildContext context) {
    Widget namaPengantin = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Search By Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    Widget searchButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 42.0,
          onPressed: () {
            // Navigator.pushNamed(context, "/homePage");
          },
          color: Colors.redAccent,
          child: Text('Search', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return new SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Schedule Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 10.0,
          ),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              namaPengantin,
              searchButton,
              new Calendar(
                // onSelectedRangeChange: (range) => print(range),
                isExpandable: false,
                dayBuilder: (BuildContext context, DateTime tgl) {
                  // String a = day.day.toString();
                  for (var i = 0; i < listScheduled.length; i++) {
                    String year = listScheduled[i].year.toString();
                    String month = listScheduled[i].month.toString();
                    String day = listScheduled[i].day.toString();
                    String dateOnly = year + month + day;
                    // print('ini day booked ' + dateOnly);
                    String yeara = tgl.year.toString();
                    String montha = tgl.month.toString();
                    String daya = tgl.day.toString();
                    String tglOnly = yeara + montha + daya;
                    // print('ini day ' + tglOnly);
                    if (tglOnly == dateOnly) {
                      return new InkWell(
                        onTap: () => _openDetailTgl(tgl),
                        child: new Container(
                          decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.amber),
                            shape: BoxShape.circle,
                            color: Colors.redAccent,
                          ),
                          child: new Text(
                            tgl.day.toString(),
                          ),
                        ),
                      );
                    }
                  }
                  return new InkWell(
                    onTap: () => _openDetailTgl(tgl),
                    child: new Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.black38)),
                      child: new Text(
                        tgl.day.toString(),
                      ),
                    ),
                  );
                },
              ),
              new Opacity(
                  opacity: _opacity,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10.0),
                    child: new Text(_tgl.day.toString(),
                        style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              new Opacity(
                  opacity: _opacity,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10.0),
                    child: new Text(
                        _convertBulan(_tgl.month) + " " + _tgl.year.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              new GestureDetector(
                  child: new Opacity(
                      opacity: _opacity,
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.yellowAccent.withOpacity(0.2),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5.0),
                        child: new Text("Morning Event",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  onTap: () {
                    _navigateToScheduleDetailPage(context, "Morning Event");
                  }),

              // new Opacity(
              //     opacity: _opacity,
              //     child: new Container(
              //       decoration: new BoxDecoration(
              //         color: Colors.red.withOpacity(0.2),
              //       ),
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.all(5.0),
              //       child: new Text("Booked",
              //           style: TextStyle(
              //             fontSize: 25.0,
              //             fontWeight: FontWeight.bold,
              //           )),
              //     )),
              new GestureDetector(
                  child: new Opacity(
                      opacity: _opacity,
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.2),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5.0),
                        child: new Text("Night Event",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  onTap: () {
                    _navigateToScheduleDetailPage(context, "Night Event");
                  })

              // new Opacity(
              //     opacity: _opacity,
              //     child: new Container(
              //       decoration: new BoxDecoration(
              //         color: Colors.red.withOpacity(0.2),
              //       ),
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.all(5.0),
              //       child: new Text("Booked",
              //           style: TextStyle(
              //             fontSize: 25.0,
              //             fontWeight: FontWeight.bold,
              //           )),
              //     )),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScheduleDetailPage(BuildContext context, String param) {
    // Navigator.pushNamed(context, "/schedulePage");
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new ScheduleDetailPage(
                param: param,
              )),
    );
  }

  _openDetailTgl(DateTime tgl) {
    setState(() {
      _tgl = tgl;
      _opacity = 0.0;
      for (var i = 0; i < listScheduled.length; i++) {
        String day = listScheduled[i].day.toString();
        if (tgl.day.toString() == day) {
          _opacity = 1.0;
        }
      }
    });
  }

  String _convertBulan(int month) {
    String bulan = "";
    if (1 == month) {
      bulan = "Januari";
    } else if (2 == month) {
      bulan = "Februari";
    } else if (3 == month) {
      bulan = "Maret";
    } else if (4 == month) {
      bulan = "April";
    } else if (5 == month) {
      bulan = "Mei";
    } else if (6 == month) {
      bulan = "Juni";
    } else if (7 == month) {
      bulan = "Juli";
    } else if (8 == month) {
      bulan = "Agustus";
    } else if (9 == month) {
      bulan = "September";
    } else if (10 == month) {
      bulan = "Oktober";
    } else if (11 == month) {
      bulan = "November";
    } else if (12 == month) {
      bulan = "Desember";
    }
    return bulan;
  }
}
