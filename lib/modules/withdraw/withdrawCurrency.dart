import 'package:CanuckCrypto/modules/myWallet/RecentTransactionsWidget.dart';
import 'dart:typed_data';
import 'package:animator/animator.dart';
import '../../constance/constance.dart';
import '../../constance/themes.dart';
import '../../modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import '../../modules/withdraw/WithdrawPopup.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class WithDrawCurrency extends StatefulWidget {
  @override
  _WithDrawCurrencyState createState() => _WithDrawCurrencyState();
}

class _WithDrawCurrencyState extends State<WithDrawCurrency> {
  bool _isInProgress = false;
  bool isShowingPopup = false;
  Uint8List bytes = Uint8List(0);
  TextEditingController _outputController;
  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  String btc = '';
  String quantity = '';
  String fee = '';

  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    waitTime();
  }

  waitTime() async {
    setState(() {
      _isInProgress = true;
      this._outputController = new TextEditingController();
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isInProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    appBarheight = appBar.preferredSize.height;
    return Stack(
      children: <Widget>[
        Scaffold(
          key: _scaffoldKey,
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75 < 400
                ? MediaQuery.of(context).size.width * 0.75
                : 350,
            child: Drawer(
              elevation: 0,
              child: AppDrawer(),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: !_isInProgress
                ? InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 15,
                          left: 15,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16, left: 16, top: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      _scaffoldKey.currentState.openDrawer();
                                    },
                                    child: Icon(
                                      Icons.sort,
                                      color: AllCoustomTheme
                                          .getsecoundTextThemeColor(),
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
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Withdraw",
                                style: TextStyle(
                                  color: AllCoustomTheme.getTextThemeColors(),
                                  fontSize: ConstanceData.SIZE_TITLE25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        border: Border.all(color: lightblue)),
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width /
                                              2.5,
                                      height: 40,
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) =>  Portfolio()),
                                        // );
                                      },
                                      shape: RoundedRectangleBorder(),
                                      child: Text("ERC20",
                                          style: TextStyle(
                                              fontSize: 13, color: lightblue)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        border: Border.all(color: lightblue)),
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width /
                                              2.5,
                                      height: 40,
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Text(
                                        "BEP20(BSC)",
                                        style: TextStyle(
                                            fontSize: 16, color: lightblue),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 40,
                                right: 40,
                                top: 30,
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 190,
                                    child: bytes.isEmpty
                                        ? Image.asset(
                                            ConstanceData.barCodeImage,
                                            height: 150,
                                            width: 150,
                                          )
                                        : Image.memory(bytes),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Scan your address from QR Code',
                                  style: TextStyle(color: black, fontSize: 12),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: _scan,
                                  child: Container(
                                    child: Icon(Icons.qr_code),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      color:
                                          AllCoustomTheme.getTextThemeColors(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey[400],
                              ),
                              child: TextField(
                                controller: this._outputController,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.wrap_text),
                                  // helperText:
                                  // 'The barcode or qrcode you scan will be displayed in this area.',
                                  hintText:
                                      'The barcode or qrcode you scan will be displayed in this area.',
                                  hintStyle: TextStyle(fontSize: 12),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 2),
                                ),
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              // highlightColor: Colors.transparent,
                              // splashColor: Colors.transparent,
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey[300]),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3.5,
                                          child: Scaffold(
                                            backgroundColor: Colors.transparent,
                                            body: WithDrawPopup(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 47,
                                alignment: FractionalOffset.center,
                                decoration: BoxDecoration(
                                  color: lightblue,
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Withdraw Payment",
                                  style: TextStyle(
                                      color: AllCoustomTheme
                                          .getReBlackAndWhiteThemeColors(),
                                      letterSpacing: 0.3,
                                      fontSize: ConstanceData.SIZE_TITLE16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CupertinoActivityIndicator(
                      radius: 12,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }

  openShowPopup() async {
    setState(() {
      isShowingPopup = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isShowingPopup = false;
    });
    _formKey.currentState.save();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AllCoustomTheme.boxColor(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Congrats',
              style: TextStyle(
                color: AllCoustomTheme.getTextThemeColors(),
                fontWeight: FontWeight.bold,
                fontSize: ConstanceData.SIZE_TITLE25,
                fontFamily: 'Ubuntu',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You did succsessfully Withdraw $btc BTC.\with Quntity $quantity and fee \$$fee',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: AllCoustomTheme.getTextThemeColors(),
                fontSize: ConstanceData.SIZE_TITLE16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 45.0,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          globals.buttoncolor1,
                          globals.buttoncolor2,
                        ],
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                        fontSize: ConstanceData.SIZE_TITLE16,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
