import 'dart:math';

import 'package:CanuckCrypto/modules/BinanceProfile/BinanceProfile.dart';
import 'package:CanuckCrypto/modules/myWallet/MyInvestmentsWidget.dart';
import 'package:CanuckCrypto/modules/myWallet/RecentTransactionsWidget.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawCurrency.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawTabbar.dart';
import 'package:CanuckCrypto/portfolio/portfolio.dart';
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
import 'package:CanuckCrypto/Global/Global.dart';


class MyWallet extends StatefulWidget {
  bool isWithoutAppBar;
  var scaffoldKey;
MyWallet({  this.isWithoutAppBar = false,
  this.scaffoldKey,});
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
        child: !_isInProgress
            ? Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, top: 10),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            !widget.isWithoutAppBar?
                            _scaffoldKey.currentState.openDrawer():
                            widget.scaffoldKey.currentState.openDrawer();
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
                      Animator(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: Duration(seconds: 1),
                        cycles: 1,
                        builder: (anim) => SizeTransition(
                          sizeFactor: anim,
                          axis: Axis.horizontal,
                          axisAlignment: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                color: AllCoustomTheme.getTextThemeColors(),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                   // Global.currencyname == null?
                    '\$' ,
                      //  :Global.currencyname ,
                    style: TextStyle(
                            color: darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: ConstanceData.SIZE_TITLE20,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            color: darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          '.95',
                          style: TextStyle(
                            color: ConstanceData.primaryBlue.withOpacity(0.3),
                            fontWeight: FontWeight.bold,
                            fontSize: ConstanceData.SIZE_TITLE20,
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: Image.asset(
                            ConstanceData.planetImage,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child:Divider(),
                  ),
                  SizedBox(
                    height: 16,
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
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  WithDrawTabbar()),
                              );
                            },
                            color: lightblue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              "Deposit",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AllCoustomTheme.getTextThemeColors(
                                      isContrast: true)),
                            ),
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width /2.5,
                            height: 40,
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WithDrawTabbar()),
                              );
                            },
                            color: lightblue,
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Container(
                  //         child: MaterialButton(
                  //           minWidth: MediaQuery.of(context).size.width / 1.2,
                  //           height: 40,
                  //           onPressed: () {
                  //
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(builder: (context) =>  BinanceProfile()),
                  //             );
                  //           },
                  //           color: lightblue,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(5),
                  //             ),
                  //           ),
                  //           child: Text(
                  //             "BUY/SELL using my binance portfolio",
                  //             style: TextStyle(
                  //                 fontSize: 13,
                  //                 color: AllCoustomTheme.getTextThemeColors(
                  //                     isContrast: true)),
                  //           ),
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),






                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Row(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 16),
                  //       child: Text(
                  //         'My Investments',
                  //         style: TextStyle(
                  //           color: AllCoustomTheme.getTextThemeColors(),
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 16, right: 2),
                  //   height: 130,
                  //
                  //   child: ListView(
                  //
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       MyInvestmentsWidget(
                  //           coinName: "BitCoin",
                  //           price: "60,0000",
                  //           coinAmount: "0.00020"),
                  //       SizedBox(width: 20),
                  //       MyInvestmentsWidget(
                  //           coinName: "BitCoin",
                  //           price: "60,0000",
                  //           coinAmount: "0.00020"),
                  //       SizedBox(width: 20),
                  //       MyInvestmentsWidget(
                  //           coinName: "BitCoin",
                  //           price: "60,0000",
                  //           coinAmount: "0.00020"),
                  //       SizedBox(width: 20),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Recent transactions',
                          style: TextStyle(
                            color: AllCoustomTheme.getTextThemeColors(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                darkblue,
                                lightblue,
                              ],
                            ),

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: ListView(
                          children: <Widget>[
                            RecentTransactionsTile(
                                title: "Apple Music",
                                type: "SUBSCRIPTION",
                                amount: "-10"),
                            RecentTransactionsTile(
                                title: "Apple Music",
                                type: "SUBSCRIPTION",
                                amount: "-10"),
                            RecentTransactionsTile(
                                title: "Apple Music",
                                type: "SUBSCRIPTION",
                                amount: "-10"),
                            RecentTransactionsTile(
                                title: "Apple Music",
                                type: "SUBSCRIPTION",
                                amount: "-10"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            : SizedBox(),
      ),
    );
  }
}
