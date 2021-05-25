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

class WithdrawPayment extends StatefulWidget {
  @override
  _WithdrawPaymentState createState() => _WithdrawPaymentState();
}
int _groupValue = -1;

class _WithdrawPaymentState extends State<WithdrawPayment> with TickerProviderStateMixin {
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
              height: 20,
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
                  "Enter Amount to WithDraw",
                  style: TextStyle(
                    fontSize: 15,
                    color: black,
                  )),
            ),

            Container(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      'Enter Amount To WithDraw',
                      style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: lightblue)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      'Account No',
                      style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: lightblue)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  InkWell(
                    // highlightColor: Colors.transparent,
                    // splashColor: Colors.transparent,
                    onTap: (){

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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

}
