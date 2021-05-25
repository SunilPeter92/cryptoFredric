import 'dart:math';

import 'package:CanuckCrypto/modules/PayCard/InteracScreen.dart';
import 'package:CanuckCrypto/modules/PayCard/PaywithCard.dart';
import 'package:CanuckCrypto/modules/buysell/Sell%20Page.dart';
import 'package:CanuckCrypto/modules/buysell/buypage.dart';
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
import 'package:CanuckCrypto/modules/withdraw/WithDrawPayment.dart';

class WithDraw extends StatefulWidget {
  @override
  _WithDrawState createState() => _WithDrawState();
}
int _groupValue = -1;

class _WithDrawState extends State<WithDraw> with TickerProviderStateMixin {
  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;
  bool _isInProgress = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
            Padding(
              padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 10
              ),
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
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'WithDraw',
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                  "The expected time to complete the transaction by the three type of options is minimun 1 hour).",
                  style: TextStyle(
                    fontSize: 15,
                    color: black,
                  )),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Payment Method",
                style:
                TextStyle(color: AllCoustomTheme.getTextThemeColors()),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  _myRadioButton(
                    title: "Paypal",
                    value: 0,
                    onChanged: (newValue) =>
                        setState(() => _groupValue = newValue),
                  ),
                  _myRadioButton(
                    title: "Interac",
                    value: 1,
                    onChanged: (newValue) =>
                        setState(() => _groupValue = newValue),
                  ),
                  _myRadioButton(
                    title: "Credit/Debit Card",
                    value: 3,
                    onChanged: (newValue) =>
                        setState(() => _groupValue = newValue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    // highlightColor: Colors.transparent,
                    // splashColor: Colors.transparent,
                    onTap: (){
                      if(_groupValue == 0 || _groupValue == 3 ){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WithdrawPayment()),
                        );

                      }else if(_groupValue == 1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WithdrawPayment()),
                        );
                      }

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      decoration: BoxDecoration(
                        color: lightblue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Continue to WithDraw",
                          style: TextStyle(
                              fontSize: 16,
                              color: AllCoustomTheme.getTextThemeColors(
                                  isContrast: true)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Note: Our transfer included",
                      style:
                      TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  )
                ],
              ),
            )
            // TabBar(
            //   controller: tabController,
            //   indicator: BoxDecoration(
            //       border: Border(
            //     bottom: BorderSide(
            //       width: 2,
            //       color: darkblue.withOpacity(0.3),
            //     ),
            //   )),
            //   tabs: [
            //     Tab(
            //       icon: Text(
            //         "Buy coin",
            //         style: TextStyle(fontSize: 16),
            //       ),
            //     ),
            //     Tab(
            //         icon: Text(
            //       "Sell coin",
            //       style: TextStyle(fontSize: 16),
            //     )),
            //   ],
            // ),
            // Expanded(
            //   child: TabBarView(
            //     controller: tabController,
            //     children: [
            //       BuyCoin(),
            //       SellCoin(),
            //     ],
            //   ),
            // ),
          ],
        )
            : SizedBox(),
      ),
    );
  }
  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      // contentPadding: EdgeInsets.zero,
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
