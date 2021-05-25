import 'dart:math';

import 'package:CanuckCrypto/auth/BasicInfo.dart';
import 'package:CanuckCrypto/auth/Identify_Address.dart';
import 'package:CanuckCrypto/auth/IdentityVerification.dart';
import 'package:CanuckCrypto/auth/VerifyKyc.dart';
import 'package:CanuckCrypto/modules/AboutUs/AboutUs.dart';
import 'package:CanuckCrypto/modules/buysell/buysell.dart';
import 'package:CanuckCrypto/modules/exchange/exchange.dart';
import 'package:CanuckCrypto/portfolio/portfolio.dart';
import 'package:animator/animator.dart';
import '../../constance/constance.dart';
import '../../constance/global.dart';
import '../../constance/themes.dart';
import '../../modules/deposite/depositeCurrency.dart';
import '../../modules/home/homeScreen.dart';
import '../../modules/Setting.dart';
import '../../modules/muitisig/multisig.dart';
import '../../modules/myWallet/wallet.dart';
import '../../modules/tradingPair/tradingPair.dart';
import '../../modules/withdraw/withdrawCurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CanuckCrypto/constance/Colors.dart';

class AppDrawer extends StatefulWidget {
  final String selectItemName;

  const AppDrawer({Key key, this.selectItemName}) : super(key: key);
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

var appBarheight = 0.0;

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    appBarheight = appBar.preferredSize.height;
    return Container(
      color: lightblue,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: appBarheight + 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60 ,
                    width: 60,
                    child: Image.asset(
                      'assets/fedriclogo.png',fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Denis Abdullin',
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(
                          isContrast: true),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1.2,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(2)),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                children: <Widget>[
                  // Row(
                  //   children: <Widget>[
                  //     Text(
                  //       'Accounts',
                  //       style: TextStyle(
                  //         color: AllCoustomTheme.getTextThemeColors(
                  //             isContrast: true),
                  //         fontSize: ConstanceData.SIZE_TITLE14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.of(context).push(
                            //   CupertinoPageRoute<void>(
                            //     builder: (BuildContext context) => BasicInfo(),
                            //   ),
                            //);
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    Icons.account_box,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Accounts',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'wallet'
                                  ? Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Animator(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: CircleAvatar(
                                      backgroundColor:
                                      globals.buttoncolor2,
                                      radius: 5,
                                    ),
                                  ),
                                ),
                              )
                                   : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    Icons.verified_user,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'wallet'
                                  ? Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Animator(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: CircleAvatar(
                                      backgroundColor:
                                      globals.buttoncolor2,
                                      radius: 5,
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext context) => VerifyKyc(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    Icons.verified_user,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Identity Verification',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'wallet'
                                  ? Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Animator(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: CircleAvatar(
                                      backgroundColor:
                                      globals.buttoncolor2,
                                      radius: 5,
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext context) => LiveTradingPair(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Balance',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'wallet'
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Animator(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        cycles: 1,
                                        builder: (anim) => Transform.scale(
                                          scale: anim.value,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                globals.buttoncolor2,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.of(context).push(
                        //       CupertinoPageRoute<void>(
                        //         builder: (BuildContext context) => Portfolio(),
                        //       ),
                        //     );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             Icons.portrait,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Portfolio',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.of(context).push(
                        //       CupertinoPageRoute<void>(
                        //         builder: (BuildContext context) => Exchange(),
                        //       ),
                        //     );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             Icons.sync_alt,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Exchange',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // // InkWell(
                        // //   highlightColor: Colors.transparent,
                        // //   splashColor: Colors.transparent,
                        // //   onTap: () {
                        // //     Navigator.pop(context);
                        // //     Navigator.of(context).push(
                        // //       CupertinoPageRoute<void>(
                        // //         builder: (BuildContext context) => BuySell(),
                        // //       ),
                        // //     );
                        // //   },
                        // //   child: Row(
                        // //     children: <Widget>[
                        // //       Animator(
                        // //         tween: Tween<double>(begin: 0, end: 1),
                        // //         duration: Duration(seconds: 1),
                        // //         cycles: 1,
                        // //         builder: (anim) => SizeTransition(
                        // //           sizeFactor: anim,
                        // //           axis: Axis.horizontal,
                        // //           axisAlignment: 1,
                        // //           child: Icon(
                        // //             FontAwesomeIcons.handHoldingUsd,
                        // //             color: AllCoustomTheme.getTextThemeColors(
                        // //                 isContrast: true),
                        // //             size: 20,
                        // //           ),
                        // //         ),
                        // //       ),
                        // //       SizedBox(
                        // //         width: 14,
                        // //       ),
                        // //       Animator(
                        // //         tween: Tween<double>(begin: 0, end: 1),
                        // //         duration: Duration(seconds: 1),
                        // //         cycles: 1,
                        // //         builder: (anim) => SizeTransition(
                        // //           sizeFactor: anim,
                        // //           axis: Axis.horizontal,
                        // //           axisAlignment: 1,
                        // //           child: Text(
                        // //             'Buy / Sell',
                        // //             style: TextStyle(
                        // //               color: AllCoustomTheme.getTextThemeColors(
                        // //                   isContrast: true),
                        // //             ),
                        // //           ),
                        // //         ),
                        // //       ),
                        // //       Expanded(
                        // //         child: SizedBox(),
                        // //       ),
                        // //       widget.selectItemName == 'tradingpair'
                        // //           ? Padding(
                        // //               padding: const EdgeInsets.only(right: 14),
                        // //               child: Animator(
                        // //                 duration: Duration(seconds: 1),
                        // //                 curve: Curves.decelerate,
                        // //                 cycles: 1,
                        // //                 builder: (anim) => Transform.scale(
                        // //                   scale: anim.value,
                        // //                   child: CircleAvatar(
                        // //                     backgroundColor:
                        // //                         globals.buttoncolor2,
                        // //                     radius: 5,
                        // //                   ),
                        // //                 ),
                        // //               ),
                        // //             )
                        // //           : SizedBox(),
                        // //     ],
                        // //   ),
                        // // ),
                        // // SizedBox(
                        // //   height: 20,
                        // // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.of(context).push(
                        //       CupertinoPageRoute<void>(
                        //         builder: (BuildContext context) =>
                        //             DepositeCurrency(),
                        //       ),
                        //     );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             FontAwesomeIcons.coins,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Deposit',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //       widget.selectItemName == 'tradingpair'
                        //           ? Padding(
                        //               padding: const EdgeInsets.only(right: 14),
                        //               child: Animator(
                        //                 duration: Duration(seconds: 1),
                        //                 curve: Curves.decelerate,
                        //                 cycles: 1,
                        //                 builder: (anim) => Transform.scale(
                        //                   scale: anim.value,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                         globals.buttoncolor2,
                        //                     radius: 5,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           : SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.of(context).push(
                        //       CupertinoPageRoute<void>(
                        //         builder: (BuildContext context) =>
                        //             WithDrawCurrency(),
                        //       ),
                        //     );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             FontAwesomeIcons.moneyCheckAlt,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Widthraw',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //       widget.selectItemName == 'tradingpair'
                        //           ? Padding(
                        //               padding: const EdgeInsets.only(right: 14),
                        //               child: Animator(
                        //                 duration: Duration(seconds: 1),
                        //                 curve: Curves.decelerate,
                        //                 cycles: 1,
                        //                 builder: (anim) => Transform.scale(
                        //                   scale: anim.value,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                         globals.buttoncolor2,
                        //                     radius: 5,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           : SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     Navigator.of(context).push(
                        //       CupertinoPageRoute<void>(
                        //         builder: (BuildContext context) => Setting(),
                        //       ),
                        //     );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             FontAwesomeIcons.cog,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Settings',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //       widget.selectItemName == 'tradingpair'
                        //           ? Padding(
                        //               padding: const EdgeInsets.only(right: 14),
                        //               child: Animator(
                        //                 duration: Duration(seconds: 1),
                        //                 curve: Curves.decelerate,
                        //                 cycles: 1,
                        //                 builder: (anim) => Transform.scale(
                        //                   scale: anim.value,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                         globals.buttoncolor2,
                        //                     radius: 5,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           : SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     // Navigator.of(context).push(
                        //     //   CupertinoPageRoute<void>(
                        //     //     builder: (BuildContext context) =>
                        //     //         LiveTradingPair(),
                        //     //   ),
                        //     // );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             FontAwesomeIcons.university,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Bank',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //       widget.selectItemName == 'tradingpair'
                        //           ? Padding(
                        //               padding: const EdgeInsets.only(right: 14),
                        //               child: Animator(
                        //                 duration: Duration(seconds: 1),
                        //                 curve: Curves.decelerate,
                        //                 cycles: 1,
                        //                 builder: (anim) => Transform.scale(
                        //                   scale: anim.value,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                         globals.buttoncolor2,
                        //                     radius: 5,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           : SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.of(context).push(
                            //   CupertinoPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         MultisigWallet(),
                            //   ),
                            // );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    FontAwesomeIcons.bell,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Notification',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'multisig'
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Animator(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        cycles: 1,
                                        builder: (anim) => Transform.scale(
                                          scale: anim.value,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                globals.buttoncolor2,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     // Navigator.of(context).push(
                        //     //   CupertinoPageRoute<void>(
                        //     //     builder: (BuildContext context) => MyWallet(),
                        //     //   ),
                        //     // );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             FontAwesomeIcons.lock,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Privacy',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       widget.selectItemName == 'wallet'
                        //           ? Padding(
                        //               padding: const EdgeInsets.only(right: 14),
                        //               child: Animator(
                        //                 duration: Duration(seconds: 1),
                        //                 curve: Curves.decelerate,
                        //                 cycles: 1,
                        //                 builder: (anim) => Transform.scale(
                        //                   scale: anim.value,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                         globals.buttoncolor2,
                        //                     radius: 5,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           : SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // InkWell(
                        //   highlightColor: Colors.transparent,
                        //   splashColor: Colors.transparent,
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //     // Navigator.of(context).push(
                        //     //   CupertinoPageRoute<void>(
                        //     //     builder: (BuildContext context) =>
                        //     //         DepositeCurrency(),
                        //     //   ),
                        //     // );
                        //   },
                        //   child: Row(
                        //     children: <Widget>[
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Icon(
                        //             FontAwesomeIcons.shieldAlt,
                        //             color: AllCoustomTheme.getTextThemeColors(
                        //                 isContrast: true),
                        //             size: 20,
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 14,
                        //       ),
                        //       Animator(
                        //         tween: Tween<double>(begin: 0, end: 1),
                        //         duration: Duration(seconds: 1),
                        //         cycles: 1,
                        //         builder: (anim) => SizeTransition(
                        //           sizeFactor: anim,
                        //           axis: Axis.horizontal,
                        //           axisAlignment: 1,
                        //           child: Text(
                        //             'Security Center',
                        //             style: TextStyle(
                        //               color: AllCoustomTheme.getTextThemeColors(
                        //                   isContrast: true),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: SizedBox(),
                        //       ),
                        //       widget.selectItemName == 'deposite'
                        //           ? Padding(
                        //               padding: const EdgeInsets.only(right: 14),
                        //               child: Animator(
                        //                 duration: Duration(seconds: 1),
                        //                 curve: Curves.decelerate,
                        //                 cycles: 1,
                        //                 builder: (anim) => Transform.scale(
                        //                   scale: anim.value,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                         globals.buttoncolor2,
                        //                     radius: 5,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //           : SizedBox(),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext context) =>
                                    WithDrawCurrency(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    FontAwesomeIcons.headset,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Support Center',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'withdraw'
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Animator(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        cycles: 1,
                                        builder: (anim) => Transform.scale(
                                          scale: anim.value,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                globals.buttoncolor2,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.of(context).push(
                            //   CupertinoPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         WithDrawCurrency(),
                            //   ),
                            // );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    FontAwesomeIcons.starHalfAlt,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Rate us',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'withdraw'
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Animator(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        cycles: 1,
                                        builder: (anim) => Transform.scale(
                                          scale: anim.value,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                globals.buttoncolor2,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext context) =>
                                    AboutUs(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    FontAwesomeIcons.info,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'About us',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'withdraw'
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Animator(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        cycles: 1,
                                        builder: (anim) => Transform.scale(
                                          scale: anim.value,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                globals.buttoncolor2,
                                            radius: 5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.of(context).push(
                            //   CupertinoPageRoute<void>(
                            //     builder: (BuildContext context) => (),
                            //   ),
                            // );
                          },
                          child: Row(
                            children: <Widget>[
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Icon(
                                    Icons.logout,
                                    color: AllCoustomTheme.getTextThemeColors(
                                        isContrast: true),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Animator(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: Duration(seconds: 1),
                                cycles: 1,
                                builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                      color: AllCoustomTheme.getTextThemeColors(
                                          isContrast: true),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              widget.selectItemName == 'wallet'
                                  ? Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Animator(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: CircleAvatar(
                                      backgroundColor:
                                      globals.buttoncolor2,
                                      radius: 5,
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     Text(
                        //       'More',
                        //       style: TextStyle(
                        //         color:
                        //             AllCoustomTheme.getsecoundTextThemeColor(),
                        //         fontSize: ConstanceData.SIZE_TITLE14,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   children: <Widget>[
                        //     Animator(
                        //       tween: Tween<double>(begin: 0, end: 2 * pi),
                        //       duration: Duration(seconds: 1),
                        //       cycles: 0,
                        //       builder: (anim) => Transform.rotate(
                        //         angle: anim.value,
                        //         child: Icon(
                        //           Icons.settings,
                        //           color: AllCoustomTheme
                        //               .getsecoundTextThemeColor(),
                        //           size: 20,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 14,
                        //     ),
                        //     Text(
                        //       'Setting',
                        //       style: TextStyle(
                        //         color: AllCoustomTheme.getTextThemeColors(
                        //             isContrast: true),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: SizedBox(),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
