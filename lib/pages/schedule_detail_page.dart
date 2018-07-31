import 'package:flutter/material.dart';

class ScheduleDetailPage extends StatefulWidget {
  String param;

  ScheduleDetailPage({Key key, @required this.param}) : super(key: key);

  @override
  _ScheduleDetailPageState createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  static const String ID = '_ScheduleDetailPageState';
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
        appBar: new AppBar(
          title: new Text("Schedule Detail Page"),
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
                    // _navigateToScheduleDetailPage(context);
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
    'Customer Information',
    <Entry>[
      new Entry('Pernikahan : Budi & Santi'),
      new Entry('Penanggung Jawab 1 : Budianto'),
      new Entry('Handphone 1: 085694949393'),
      new Entry('Penanggung Jawab 2 : Surianto'),
      new Entry('Handphone 2: 085694949393'),
    ],
  ),
  new Entry(
    'Vendor Information',
    <Entry>[
      new Entry('Wedding Organizer : xxx Wedding'),
      new Entry('Catering : xxx Catering'),
      new Entry('Decoration: xxx Decoration'),
      new Entry('PhotoGrapher : xxx Photographer'),
      new Entry('Entertainment: xxx Entertainment'),
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
          subtitle: new Text("subtitle"),
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
