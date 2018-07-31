import 'package:flutter/material.dart';

class PaymentDetailPage extends StatefulWidget {
  String param;

  PaymentDetailPage({Key key, @required this.param}) : super(key: key);

  @override
  _PaymentDetailPageState createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  static const String ID = '_PaymentDetailPageState';
  double _opacity;
  DateTime _tgl;
  String _event;

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

  @override
  initState() {
    super.initState();
    var param = widget.param;
    print("url $param");
    _tgl = new DateTime.now();
    _opacity = 1.0;
    _event = param;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(title: new Text("Payment Detail Page")),
        body: new Container(
          margin: new EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 10.0,
          ),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
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
                        child: new Text(_event,
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  onTap: () {
                    // _navigateToPaymentDetailPage(context);
                  }),
              new Container(
                height: 350.0,
                child: new ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      new EntryItem(data[index]),
                  itemCount: data.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry(
    'Customer Payment',
    <Entry>[
      new Entry('Booking Fee : IDR 1.000.000'),
      new Entry('DP 1 : IDR 10.000.000'),
      new Entry('DP 2 : IDR 15.000.000'),
      new Entry('DP 3 : IDR 25.000.000'),
      new Entry('Other Charge : IDR 5.000.000'),
    ],
  ),
  new Entry(
    'Vendor Payment',
    <Entry>[
      new Entry('Wedding Organizer Charge : IDR 5.000.000'),
      new Entry('Catering Charge : IDR 50.000.000'),
      new Entry('Decoration Charge: IDR 25.000.000'),
      new Entry('PhotoGrapher Charge : IDR 20.000.000'),
      new Entry('Entertainment Charge: IDR 15.000.000'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return new ListTile(
          trailing: (root.title.contains("DP")||root.title.contains("Booking")) == true
              ? new Icon(Icons.image)
              : null,            
          title: new Text(root.title,
              style: new TextStyle(
                color: Colors.blueAccent,
                fontSize: 15.0,
              )));
    return new ExpansionTile(
      leading: new Icon(Icons.info),
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title,
          style: new TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          )),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
