import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class BuyCoin extends StatefulWidget {
  @override
  _BuyCoinState createState() => _BuyCoinState();
}

class _BuyCoinState extends State<BuyCoin> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isInProgress = false;

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  loadUserDetails() async {
    setState(() {
      _isInProgress = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      _isInProgress = false;
    });
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
          child: AppDrawer(),
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isInProgress,
        opacity: 0,
        progressIndicator: CupertinoActivityIndicator(
          radius: 12,
        ),
        child: !_isInProgress
            ? Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(
                          'CANUCKCRYPTO',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Buy Crypto',
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    size: 100,
                    color: lightblue,
                  ),
                  Text(
                    'Purchased Successful',
                    style: TextStyle(
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 2.5,
                          height: 40,
                          onPressed: () {},
                          color: lightblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            "ViewHistory",
                            style: TextStyle(
                                fontSize: 13,
                                color: AllCoustomTheme.getTextThemeColors(
                                    isContrast: true)),
                          ),
                        ),
                      ),
                      Container(
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 2.5,
                          height: 40,
                          onPressed: () {},
                          color: lightblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            "View Wallet",
                            style: TextStyle(
                                fontSize: 16,
                                color: AllCoustomTheme.getTextThemeColors(
                                    isContrast: true)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}
