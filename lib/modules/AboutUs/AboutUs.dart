import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:connectivity/connectivity.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var subscription;
  bool _isInProgress = false;


  void initState() {
    super.initState();
    checkConnection();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result.index != 2) {
        showInSnackBar(ConstanceData.GotInternet, isGreeen: true);
      } else {
        showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
      }
    });
  }
  Future showInSnackBar(String value, {bool isGreeen = false}) async {
    await Future.delayed(const Duration(milliseconds: 700));
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          value,
          style: TextStyle(
            color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
          ),
        ),
        backgroundColor: isGreeen ? Colors.green : Colors.red,
      ),
    );
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75 < 400
            ? MediaQuery.of(context).size.width * 0.75
            : 350,
        child: Drawer(
          child: AppDrawer(
            selectItemName: 'tradingpair',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isInProgress,
        opacity: 0,
        progressIndicator: CupertinoActivityIndicator(
          radius: 12,
        ),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 10
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.sort,
                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                      ),
                    ),
                    Spacer(),
                    Text('CANUCKCRYPTO', style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 15 , color: black),),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/Federick Logo Final.png' , height: 250,),
              Container(
                width: MediaQuery.of(context).size.width/1.2,
                child: Text("CanuckCrypto is a non-custodial trading application which allows you to buy and sell crypto currencies directly from the largest exchange of crypto currencies. The rates are updated instantly and the slippage, the difference in rates between the time it takes to send the order and fill it, is also smallercompared to other exchanges." ,
                maxLines: 12,
                  style: TextStyle(color: black , fontSize: 18 , letterSpacing: 0.9),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
