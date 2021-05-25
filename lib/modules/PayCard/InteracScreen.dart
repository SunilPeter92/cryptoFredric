import 'dart:math';

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
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';



class InteracScreen extends StatefulWidget {
  @override
  _InteracScreenState createState() => _InteracScreenState();
}
int _groupValue = -1;

class _InteracScreenState extends State<InteracScreen> with TickerProviderStateMixin {
  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;
  bool _isInProgress = false;
  var string = 'BHET739HJY';

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

            Image.asset(
              'assets/InteracLogo.png',
              width: 280,
              height: 200,
              //fit: BoxFit.fill,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Please send your Interac E-Transfer to',
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              child: Text(
                "abc@gmail.com",
                style:
                TextStyle(color: AllCoustomTheme.getTextThemeColors()),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    'Important Instruction',
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 15),
                  child: Container(
                    width: 300,
                    child: Text(
                      '1. Use your username as the security question',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45,),
                  child: Container(
                    width: 300,
                    child: Text(
                      'ABC',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45, top: 15),
                  child: Container(
                    width: 300,
                    child: Text(
                      '2. Use this code as the security answer',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45,),
                  child: Container(
                    width: 300,
                    child: Text(
                      string,
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              // highlightColor: Colors.transparent,
              // splashColor: Colors.transparent,
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Copy to clipboard",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
                Clipboard.setData(new ClipboardData(text: string.toString() ));
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
                    "Copy Security Code",
                    style: TextStyle(
                        fontSize: 16,
                        color: AllCoustomTheme.getTextThemeColors(
                            isContrast: true)),
                  ),
                ),
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

