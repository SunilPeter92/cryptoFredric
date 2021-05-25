import 'dart:math';

import 'package:CanuckCrypto/modules/myWallet/MyInvestmentsWidget.dart';
import 'package:CanuckCrypto/modules/myWallet/RecentTransactionsWidget.dart';
import 'package:animator/animator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../constance/constance.dart';
import '../../constance/global.dart';
import '../../constance/themes.dart';
import '../../modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:CanuckCrypto/constance/Colors.dart';

class Exchange extends StatefulWidget {
  bool isWithoutAppBar;
  var scaffoldKey;
  Exchange({
    this.isWithoutAppBar = false,
    this.scaffoldKey,
  });
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  var appBarheight = 0.0;
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

  String dropDownSelectedValue1 = 'BTC';
  String dropDownSelectedValue2 = 'LTC';

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    appBarheight = appBar.preferredSize.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75 < 400
            ? MediaQuery.of(context).size.width * 0.75
            : 350,
        child: Drawer(
          child: AppDrawer(
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
        child: !_isInProgress
            ? Column(
                children: <Widget>[
                  !widget.isWithoutAppBar
                      ? SizedBox(
                    height: appBarheight,
                  )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if(widget.isWithoutAppBar==false){
                              _scaffoldKey.currentState.openDrawer();
                            }else{
                              widget.scaffoldKey.currentState.openDrawer();
                            }
                          },
                          child: Icon(
                            Icons.sort,
                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                          ),
                        ),
                        Spacer(),
                        Container(
                          // height: 40 ,
                          // width: 40,
                          child: Image.asset(
                            'assets/fedriclogo.png',fit: BoxFit.cover,
                            height: 50 ,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Exchange',
                            style: TextStyle(
                              color: AllCoustomTheme.getTextThemeColors(),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "Pay",
                            style: TextStyle(
                              color: AllCoustomTheme.getTextThemeColors()
                                  .withOpacity(0.7),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 40,
                              alignment: Alignment.bottomLeft,
                              child: new DropdownButton(
                                underline: Container(),
                                iconDisabledColor: ConstanceData.primaryBlue,
                                iconEnabledColor: ConstanceData.primaryBlue,

                                // Not necessary for Option 1
                                isDense: true,
                                value: dropDownSelectedValue1,
                                onChanged: (newValue) {
                                  setState(() {
                                    dropDownSelectedValue1 = newValue;
                                  });
                                },
                                items: ["BTC", "ETH", "LTC"].map((location) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      location,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    value: location,
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              height: 40,
                              width: 250,
                              child: Theme(
                                data: ThemeData(
                                    focusColor: ConstanceData.primaryBlue),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  textAlign: TextAlign.right,
                                  autofocus: false,
                                  initialValue: '',
                                  decoration: InputDecoration(
                                    hintText: '0.000000000',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                    counterText: "",
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            "Use all 0.00000 BTC",
                            style: TextStyle(
                              color: AllCoustomTheme.getTextThemeColors()
                                  .withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "Receive",
                            style: TextStyle(
                              color: AllCoustomTheme.getTextThemeColors()
                                  .withOpacity(0.7),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 40,
                              alignment: Alignment.bottomLeft,
                              child: new DropdownButton(
                                underline: Container(),
                                iconDisabledColor: ConstanceData.primaryBlue,
                                iconEnabledColor: ConstanceData.primaryBlue,

                                // Not necessary for Option 1
                                isDense: true,
                                value: dropDownSelectedValue2,
                                onChanged: (newValue) {
                                  setState(() {
                                    dropDownSelectedValue2 = newValue;
                                  });
                                },
                                items: ["BTC", "ETH", "LTC"].map((location) {
                                  return DropdownMenuItem(
                                    child: new Text(
                                      location,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    value: location,
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              height: 40,
                              width: 250,
                              child: Theme(
                                data: ThemeData(
                                    focusColor: ConstanceData.primaryBlue),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  textAlign: TextAlign.right,
                                  autofocus: false,
                                  initialValue: '',
                                  decoration: InputDecoration(
                                    hintText: '0.000000000',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                    counterText: "",
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      onPressed: () {},
                      color: lightblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Exchange",
                        style: TextStyle(
                            fontSize: 16,
                            color: AllCoustomTheme.getTextThemeColors(
                                isContrast: true)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
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
                              "Deposit",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AllCoustomTheme.getTextThemeColors(
                                      isContrast: true)),
                            ),
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width /2.5,
                            height: 40,
                            onPressed: () {},
                            color: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              "Withdraw",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AllCoustomTheme.getTextThemeColors(
                                      isContrast: true)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : SizedBox(),
      ),
    );
  }
}
