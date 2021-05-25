import 'dart:math';
import 'package:CanuckCrypto/modules/buysell/buypage.dart';
import 'package:CanuckCrypto/modules/buysell/buysell.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawTabbar.dart';
import 'package:animator/animator.dart';
import 'package:connectivity/connectivity.dart';
import '../../api/apiProvider.dart';
import '../../constance/constance.dart';
import '../../constance/global.dart';
import '../../constance/themes.dart';
import '../../model/liveTradingPairModel.dart';
import '../../modules/drawer/drawer.dart';
import '../../modules/tradingPair/pairDescription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constance/global.dart' as globals;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/modules/withdraw/WithDraw.dart';

class LiveTradingPair extends StatefulWidget {
  bool isWithoutAppBar;
  var scaffoldKey;
  LiveTradingPair({
    this.isWithoutAppBar = false,
    this.scaffoldKey,
  });
  @override
  _LiveTradingPairState createState() => _LiveTradingPairState();
}

class _LiveTradingPairState extends State<LiveTradingPair> {
  bool _isInProgress = false;

  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<TradingPair> tradingPair;
  List<TradingPair> searchTradingPair = [];

  var subscription;

  @override
  void initState() {
    super.initState();
    checkConnection();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result.index != 2) {
        showInSnackBar(ConstanceData.GotInternet, isGreeen: true);
        loadUserDetails();
      } else {
        showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
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
      loadUserDetails();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
      }
    }

    loadUserDetails() async {
      setState(() {
        _isInProgress = true;
      });
      tradingPair = await ApiProvider().getTradingPairsDetail();
      setState(() {
        _isInProgress = false;
      });
    }

  @override
  Widget build(BuildContext context) {
    // AppBar appBar = AppBar();
    // appBarheight = appBar.preferredSize.height;
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
        child: Column(
          children: <Widget>[
            // !widget.isWithoutAppBar
            //     ? SizedBox(
            //         height: appBarheight,
            //       )
            //     : Container(),
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
                    height: 60 ,
                    width: 60,
                    child: Image.asset(
                      'assets/fedriclogo.png',fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15 , left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Balance',
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: ConstanceData.SIZE_TITLE25,
                    ),
                  ),
                  Text(
                    "\$0",
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: MaterialButton(
                      minWidth: 40,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  BuySell()),);
                      },
                      color: lightblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Add Fund",
                        style: TextStyle(
                          fontSize: 16,
                          color: AllCoustomTheme.getTextThemeColors(
                              isContrast: true),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      minWidth: 40,
                      height: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WithDraw()),);
                      },
                      color: lightblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "WithDraw",
                        style: TextStyle(
                          fontSize: 16,
                          color: AllCoustomTheme.getTextThemeColors(
                              isContrast: true),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),

            SizedBox(
              height: 10,
            ),
            !_isInProgress
                ? tradingPair.length != 0
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15,),
                          child: Container(
                            child: ListView.builder(
                              // physics: BouncingScrollPhysics(),
                              itemCount: _isSearch
                                  ? searchTradingPair.length
                                  : tradingPair.length,
                              itemBuilder: (context, index) {
                                var finalTradingPair = _isSearch
                                    ? searchTradingPair[index]
                                    : tradingPair[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom:5),
                                  child: Container(
                                    height: 66,
                                    child: InkWell(
                                      onTap:(){
                                        Navigator.of(context)
                                            .push(
                                          CupertinoPageRoute(
                                            builder: (BuildContext
                                            context) =>
                                                PairDescription(
                                                  tradingPair:
                                                  finalTradingPair,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 66,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: darkblue),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            // MagicBoxGradiantLine(),
                                            Container(
                                              height: 64,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          finalTradingPair.name
                                                              // .toString() +
                                                              // ' (' +
                                                              // finalTradingPair
                                                              //     .urlSymbol +
                                                              // ')'
                                                          ,
                                                          style: TextStyle(
                                                            color: AllCoustomTheme
                                                                .getTextThemeColors(
                                                                isContrast: false),
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(),
                                                        ),
                                                        Text(
                                                          finalTradingPair
                                                              .minimumOrder
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: AllCoustomTheme
                                                                .getTextThemeColors(
                                                                isContrast: false),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          finalTradingPair.description
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: AllCoustomTheme
                                                                .getTextThemeColors(
                                                                isContrast: false),
                                                            fontSize: ConstanceData
                                                                .SIZE_TITLE12,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Icon(Icons.arrow_forward_ios_rounded, size: 14,)
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    // Row(
                                                    //   children: <Widget>[
                                                    //     Icon(
                                                    //       Icons
                                                    //           .check_circle_outline,
                                                    //       size: 14,
                                                    //       color: Colors.green,
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 4,
                                                    //     ),
                                                    //     Text(
                                                    //       finalTradingPair.trading,
                                                    //       style: TextStyle(
                                                    //         color: AllCoustomTheme
                                                    //             .getTextThemeColors(
                                                    //             isContrast: false),
                                                    //         fontSize: ConstanceData
                                                    //             .SIZE_TITLE12,
                                                    //       ),
                                                    //     ),
                                                    //     Expanded(
                                                    //       child: SizedBox(),
                                                    //     ),
                                                    //     InkWell(
                                                    //       highlightColor:
                                                    //       Colors.transparent,
                                                    //       splashColor:
                                                    //       Colors.transparent,
                                                    //       onTap: () {
                                                    //         Navigator.of(context)
                                                    //             .push(
                                                    //           CupertinoPageRoute(
                                                    //             builder: (BuildContext
                                                    //             context) =>
                                                    //                 PairDescription(
                                                    //                   tradingPair:
                                                    //                   finalTradingPair,
                                                    //                 ),
                                                    //           ),
                                                    //         );
                                                    //       },
                                                    //       child: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: black,)
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                ConstanceData.planetImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Something Wents To Wrong\nPlease try Again',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AllCoustomTheme.getTextThemeColors(),
                              ),
                            ),
                          ],
                        ),
                      )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void filterSearchResults(String query) {
    searchTradingPair.clear();
    if (query != "") {
      tradingPair.forEach((pair) {
        if (pair.name.contains(query) ||
            pair.name.toLowerCase().contains(query) ||
            pair.name.toUpperCase().contains(query) ||
            pair.description.contains(query) ||
            pair.description.toLowerCase().contains(query) ||
            pair.description.toUpperCase().contains(query)) {
          searchTradingPair.add(pair);
        }
      });
      setState(() {
        _isSearch = true;
      });
    } else {
      setState(() {
        _isSearch = false;
      });
    }
  }

  bool _isSearch = false;
}
