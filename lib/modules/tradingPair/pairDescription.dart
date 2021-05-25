import 'dart:math';
import 'package:CanuckCrypto/modules/deposite/depositeCurrency.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawTabbar.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/graphDetail/OHLCVGraph.dart';
import 'package:CanuckCrypto/modules/buysell/BuyCrypto.dart';
import 'package:CanuckCrypto/modules/buysell/SellCrypto.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawCurrency.dart';
import 'package:CanuckCrypto/portfolio/portfolio.dart';
import 'package:animator/animator.dart';
import 'package:connectivity/connectivity.dart';
import '../../api/apiProvider.dart';
import '../../constance/constance.dart';
import '../../constance/global.dart';
import '../../constance/themes.dart';
import '../../model/PairDetailInfoModel.dart';
import '../../model/PairTransactionDetailModel.dart';
import '../../model/liveTradingPairModel.dart';
import '../../modules/tradingPair/tradingPairLiveChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:CanuckCrypto/modules/muitisig/multisig.dart';

class PairDescription extends StatefulWidget {
  final TradingPair tradingPair;
  final List<TransactionDetail> transactionDetail;
  const PairDescription({Key key, this.tradingPair, this.transactionDetail})
      : super(key: key);
  @override
  _PairDescriptionState createState() => _PairDescriptionState();
}

class _PairDescriptionState extends State<PairDescription> {
  bool _isInProgress = false;

  var appBarheight = 0.0;
  var height = 0.0;
  var subscription;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();


  List sampleData = [
    {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
    {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
    {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
    {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
    {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
    {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
    {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
  ];


  PairDetailInfo pairDetailInfo;
  List<TransactionDetail> transactionDetail = [];
  List<TransactionDetail> buyColumn = [];
  List<TransactionDetail> sellColumn = [];
  List<double> transactionList = [];

  @override
  void initState() {
    super.initState();
    checkConnection();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result.index != 2) {
        showInSnackBar(ConstanceData.GotInternet, isGreeen: true);
        getPairDescriptionDetail();
      } else {
        showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
      }
    });
    //  setChart();
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
    getPairDescriptionDetail();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
    }
  }

  getPairDescriptionDetail() async {
    setState(() {
      _isInProgress = true;
    });
    pairDetailInfo =
        await ApiProvider().getPairInfoDetail(widget.tradingPair.urlSymbol);

    transactionDetail.clear();
    buyColumn.clear();
    sellColumn.clear();

    transactionDetail = await ApiProvider()
        .getPairsTransactionDetail(widget.tradingPair.urlSymbol);
    transactionDetail.sort((f, g) => g.date.compareTo(f.date));
    transactionDetail.forEach((f) {
      transactionList.add(f.price);
      if (f.type == '0') {
        buyColumn.add(f);
      } else {
        sellColumn.add(f);
      }
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isInProgress = false;
    });

    setState(() {
      _isInProgress = false;
    });
  }

  setChart() async {
    setState(() {
      _isInProgress = true;
    });
    widget.transactionDetail.sort((f, g) => g.date.compareTo(f.date));
    widget.transactionDetail.forEach((f) {
      transactionList.add(f.price);
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isInProgress = false;
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    appBarheight = appBar.preferredSize.height;
    height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        SafeArea(
          bottom: true,
          child: Scaffold(
            key: _scaffoldKey,
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
                              right: 16, left: 16, top: 10),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AllCoustomTheme.getTextThemeColors(),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                widget.tradingPair.name,
                                style: TextStyle(
                                  color: AllCoustomTheme.getTextThemeColors(),
                                  fontSize: ConstanceData.SIZE_TITLE18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        pairDetailInfo != null
                            ? Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        children: <Widget>[
                                          MagicBoxGradiantLine(),
                                          Container(
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(30),
                                              ),
                                              color: lightblue,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                bottom: 10,
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons.bitcoin,
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(
                                                            isContrast: true),
                                                    size: 50,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    pairDetailInfo.last
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(
                                                              isContrast: true),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, top: 5),
                                                    child: Text(
                                                      "USD",
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getTextThemeColors(
                                                                isContrast:
                                                                    true),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                  Text(
                                                    widget.tradingPair.urlSymbol
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(
                                                              isContrast: true),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
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
                                          right: 12, left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6),
                                                    child: Text(
                                                      'High',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getsecoundTextThemeColor(),
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    pairDetailInfo.high,
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: ConstanceData
                                                          .SIZE_TITLE14,
                                                    ),
                                                  ),
                                                  Animator(
                                                    tween: Tween<Offset>(
                                                        begin: Offset(0, -0.1),
                                                        end: Offset(0, 0.2)),
                                                    duration:
                                                        Duration(seconds: 1),
                                                    cycles: 0,
                                                    builder: (anim) =>
                                                        FractionalTranslation(
                                                      translation: anim.value,
                                                      child: Icon(
                                                        Icons.arrow_upward,
                                                        color: Colors.green,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Low',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getsecoundTextThemeColor(),
                                                      fontSize: ConstanceData
                                                          .SIZE_TITLE14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    pairDetailInfo.low,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
                                                      fontSize: ConstanceData
                                                          .SIZE_TITLE14,
                                                    ),
                                                  ),
                                                  Animator(
                                                    tween: Tween<Offset>(
                                                        begin: Offset(0, -0.1),
                                                        end: Offset(0, 0.2)),
                                                    duration:
                                                        Duration(seconds: 1),
                                                    cycles: 0,
                                                    builder: (anim) =>
                                                        FractionalTranslation(
                                                      translation: anim.value,
                                                      child: Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.red,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Vol',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getsecoundTextThemeColor(),
                                                      fontSize: ConstanceData
                                                          .SIZE_TITLE14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    double.parse(pairDetailInfo
                                                                .volume)
                                                            .toStringAsFixed(
                                                                4) +
                                                        ' B',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(),
                                                      fontSize: ConstanceData
                                                          .SIZE_TITLE14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    !_isInProgress
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[

                                                SizedBox(
                                                  width: 3,
                                                ),
                                               transactionList.length != null ? Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          left: BorderSide(color: darkblue),
                                                        bottom: BorderSide(color: darkblue )
                                                      ),

                                                  ),
                                                  height: 200,
                                                  child: Sparkline(
                                                    data: transactionList,
                                                    lineColor: lightblue,
                                                    // lineGradient:
                                                    //     LinearGradient(
                                                    //   colors: [
                                                    //     globals.buttoncolor1,
                                                    //     globals.buttoncolor2
                                                    //   ],
                                                    // ),
                                                    pointColor: AllCoustomTheme
                                                        .getTextThemeColors(),
                                                    lineWidth: 1,
                                                    fillMode: FillMode.below,
                                                    fillColor:
                                                        Colors.transparent,
                                                    // fillGradient: LinearGradient(colors: [globals.buttoncolor1, globals.buttoncolor2]),
                                                  ),
                                                ):Container(child: Text("Nothing Found"),),
                                                // Container(
                                                //   height: 300.0,
                                                //   child: new OHLCVGraph(
                                                //       data: sampleData,
                                                //       enableGridLines: false,
                                                //       volumeProp: 0.2,
                                                //     fallbackWidth: MediaQuery.of(context).size.width/1.2,
                                                //     lineWidth: 2,
                                                //     gridLineLabelColor: lightblue,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            height: 200,
                                            child: Center(
                                              child: CupertinoActivityIndicator(
                                                radius: 12,
                                              ),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            onTap:(){
                                              getPairDescriptionDetail();
                                              },
                                            child: Container(

                                              height: 30 ,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: lightblue,
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "5 mint",
                                                  style: TextStyle(
                                                    color: white, fontSize: 13
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30,),
                                          InkWell(
                                            onTap:(){
                                              getPairDescriptionDetail();
                                            },
                                            child: Container(

                                              height: 30 ,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: lightblue,
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "15 mint",
                                                  style: TextStyle(
                                                      color: white, fontSize: 13
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 25,
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 16, right: 16),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    //     children: <Widget>[
                                    //       Text(
                                    //         'Price Chart',
                                    //         style: TextStyle(
                                    //           fontWeight: FontWeight.bold,
                                    //           color: AllCoustomTheme
                                    //               .getsecoundTextThemeColor(),
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         'Settlement',
                                    //         style: TextStyle(
                                    //           color: AllCoustomTheme
                                    //               .getTextThemeColors(),
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         'Trade History',
                                    //         style: TextStyle(
                                    //           fontWeight: FontWeight.bold,
                                    //           color: AllCoustomTheme
                                    //               .getsecoundTextThemeColor(),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Container(
                                        height: 35,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4),
                                                child: Text(
                                                  'Buy',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 24),
                                                child: Text(
                                                  'Volume',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: Text(
                                                  'Sell',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                  'Volume',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0,
                                    ),
                                    buyColumn != null || sellColumn != null
                                        ? Expanded(
                                      child: Animator(
                                        duration: Duration(seconds: 1),
                                        cycles: 1,
                                        builder: (anim) =>
                                            Transform.scale(
                                              scale: anim.value,
                                              child: Container(
                                                height: 400,
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: ListView.builder(
                                                        padding:
                                                        EdgeInsets.only(
                                                            right: 10),
                                                        physics:
                                                        BouncingScrollPhysics(),
                                                        itemCount:
                                                        buyColumn.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 16),
                                                            child: Container(
                                                              height: 30,
                                                              color: index %
                                                                  2 ==
                                                                  0
                                                                  ? Colors.white
                                                                  : Colors.white,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                        10),
                                                                    child: Text(
                                                                      double.parse(buyColumn[index]
                                                                          .amount)
                                                                          .toStringAsFixed(
                                                                          4),
                                                                      style:
                                                                      TextStyle(
                                                                        color: AllCoustomTheme
                                                                            .getTextThemeColors(),
                                                                        fontSize:
                                                                        ConstanceData.SIZE_TITLE14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        10),
                                                                    child: Text(
                                                                      buyColumn[
                                                                      index]
                                                                          .price
                                                                          .toStringAsFixed(
                                                                          4),
                                                                      style:
                                                                      TextStyle(
                                                                        color: AllCoustomTheme
                                                                            .getTextThemeColors(),
                                                                        fontSize:
                                                                        ConstanceData.SIZE_TITLE14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                        padding:
                                                        EdgeInsets.only(
                                                            left: 10),
                                                        physics:
                                                        BouncingScrollPhysics(),
                                                        itemCount:
                                                        sellColumn.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Container(
                                                            height: 30,
                                                            color: index % 2 ==
                                                                0
                                                                ? Colors.white
                                                                : Colors.white,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                                  child: Text(
                                                                    double.parse(sellColumn[index]
                                                                        .amount)
                                                                        .toStringAsFixed(
                                                                        4),
                                                                    style:
                                                                    TextStyle(
                                                                      color: AllCoustomTheme
                                                                          .getTextThemeColors(),
                                                                      fontSize:
                                                                      ConstanceData
                                                                          .SIZE_TITLE14,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                      14),
                                                                  child: Text(
                                                                    sellColumn[
                                                                    index]
                                                                        .price
                                                                        .toStringAsFixed(
                                                                        4),
                                                                    style:
                                                                    TextStyle(
                                                                      color: AllCoustomTheme
                                                                          .getTextThemeColors(),
                                                                      fontSize:
                                                                      ConstanceData
                                                                          .SIZE_TITLE14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                      ),
                                    )
                                        : CupertinoActivityIndicator(
                                      radius: 12,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: FlatButton(
                                              padding: EdgeInsets.only(
                                                  bottom: 10),
                                              child: Container(
                                                height: 45.0,
                                                alignment:
                                                FractionalOffset
                                                    .center,
                                                decoration:
                                                BoxDecoration(
                                                  color: lightblue,
                                                  border: Border.all(
                                                      color:
                                                      Colors.white,
                                                      width: 1.3),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                                ),
                                                child: Text(
                                                  "DEPOSIT",
                                                  style: TextStyle(
                                                    color: AllCoustomTheme
                                                        .getReBlackAndWhiteThemeColors(),
                                                    letterSpacing: 0.3,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DepositeCurrency()),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: FlatButton(
                                              padding: EdgeInsets.only(
                                                  bottom: 10),
                                              child: new Container(
                                                height: 45.0,
                                                alignment:
                                                FractionalOffset
                                                    .center,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  new BorderRadius
                                                      .circular(5),
                                                  color: lightblue,
                                                ),
                                                child: Text(
                                                  "WITHDRAW",
                                                  style: new TextStyle(
                                                    color: AllCoustomTheme
                                                        .getTextThemeColors(
                                                        isContrast:
                                                        true),
                                                    letterSpacing: 0.3,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WithDrawCurrency()),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    !_isInProgress
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: SizedBox(
                                              height: 55,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: FlatButton(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: Container(
                                                        height: 45.0,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: lightblue,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Text(
                                                          "BUY",
                                                          style: TextStyle(
                                                            color: AllCoustomTheme
                                                                .getReBlackAndWhiteThemeColors(),
                                                            letterSpacing: 0.3,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  BuyCrypto()),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: FlatButton(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10),
                                                      child: new Container(
                                                        height: 45.0,
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .circular(5),
                                                          color: lightblue,
                                                        ),
                                                        child: Text(
                                                          "SELL",
                                                          style: new TextStyle(
                                                            color: AllCoustomTheme
                                                                .getTextThemeColors(
                                                                    isContrast:
                                                                        true),
                                                            letterSpacing: 0.3,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SellCrypto()),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Animator(
                                      tween:
                                          Tween<double>(begin: 0, end: 2 * pi),
                                      duration: Duration(seconds: 2),
                                      repeats: 0,
                                      builder: (anim) => Transform(
                                        transform:
                                            Matrix4.rotationZ(anim.value),
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                            ConstanceData.planetImage,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Animator(
                                      duration: Duration(seconds: 1),
                                      cycles: 1,
                                      builder: (anim) => Transform.scale(
                                        scale: anim.value,
                                        child: Text(
                                          'Something Wents To Wrong\nPlease try Again',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AllCoustomTheme
                                                .getTextThemeColors(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ],
                    )
                  : SizedBox(),
            ),
          ),
        )
      ],
    );
  }
}
