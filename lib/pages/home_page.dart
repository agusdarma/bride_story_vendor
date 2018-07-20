import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        body: _createContent(context),
      ),
    );
  }

  Widget _createContent(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 7 / 100;
    return new Container(
        alignment: FractionalOffset.bottomCenter,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/background_home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: _height),
            _createProfile(context),
            SizedBox(height: 20.0),
            _createHeading(context),
            SizedBox(height: 5.0),
            _createNavButtons(context),
          ],
        ));
  } //

  Widget _createProfile(BuildContext context) {
    Widget profile = new Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white, width: 2.0),
          borderRadius: new BorderRadius.circular(80.0),
          color: Colors.white),
      child: new Column(
        children: <Widget>[
          new Image.asset(
            'assets/images/profile_person.png',
            width: MediaQuery.of(context).size.width * 1 / 6,
            height: MediaQuery.of(context).size.width * 1 / 6,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
    return profile;
  }

  Widget _createHeading(BuildContext context) {
//    double _width = MediaQuery.of(context).size.width - 20.0;
    return new Image.asset(
      'assets/images/logo.png',
      //width: _width, //300.0,
      width: 240.0,
      height: 60.0,
      //fit: BoxFit.contain,
    );
  }

  Widget _createCardNavButton(
      {BuildContext context, String imageName, String label, Function onTap}) {
    return
        //new Card(
        new Container(
            height: MediaQuery.of(context).size.width * 1 / 8,
            width: MediaQuery.of(context).size.width * 1 / 8,
            margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.white, width: 2.0),
              borderRadius: new BorderRadius.circular(30.0),
              gradient: new LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [const Color(0xFFCCCCCC), const Color(0xFFFFFFFF)],
                  end: Alignment.topCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.repeated),
            ),
            child: new ListTile(
              title: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: new Center(
                        child: new Image.asset(
                      imageName,
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    )),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    height: 40.0,
                    child: new Center(
                      child: new Text(
                        label,
                        style: new TextStyle(
                          color: new Color(0xFFE5131D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              onTap: onTap,
            ));
    //);
  }

  Widget _createNavButtons(BuildContext context) {
    // String labelBankingTrx = AppsLang.get().bankingTrx;
    // String labelMerchantTrx = AppsLang.get().merchantTrx;
    // String labelPromo = AppsLang.get().promo;
    // String labelOthers = AppsLang.get().others;
    String labelBankingTrx = "4D Ballroom";
    String labelMerchantTrx = "Schedule Date";
    String labelPromo = "Vendor Schedule";
    String labelOthers = "Payment";

    return new Expanded(
        flex: 1,
        child: new GridView.count(
          padding: const EdgeInsets.all(20.0),
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            _createCardNavButton(
                context: context,
                imageName: 'assets/images/home_transaksi_perbankan.png',
                label: labelBankingTrx,
                onTap: () {
                  // print('[$ID] Profile: ${_profile?.selectedBank}');
                  // if (_profile != null && _profile.selectedBank != '')
                  //   Navigator.pushNamed(context, 'list-bank');
                  // else
                  //   Navigator.pushNamed(context, 'choose-bank/init');
                }),
            _createCardNavButton(
                context: context,
                imageName: 'assets/images/home_transaksi_merchant.png',
                label: labelMerchantTrx,
                onTap: () {
                  // Navigator.pushNamed(context, 'merchantlist');
                }),
            _createCardNavButton(
                context: context,
                imageName: 'assets/images/home_promosi_program.png',
                label: labelPromo,
                onTap: () {
                  // Navigator.pushNamed(context, 'advertising');
                }),
            _createCardNavButton(
                context: context,
                imageName: 'assets/images/home_lainnya.png',
                label: labelOthers,
                onTap: () {
                  // Navigator.pushNamed(context, 'other');
                }),
          ],
        ));
  }
}
