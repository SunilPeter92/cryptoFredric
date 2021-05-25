import 'dart:typed_data';

import 'package:animator/animator.dart';
import '../../constance/constance.dart';
import '../../constance/global.dart';
import '../../constance/themes.dart';
import '../../modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constance/global.dart' as globals;
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DepositeCurrency extends StatefulWidget {
  @override
  _DepositeCurrencyState createState() => _DepositeCurrencyState();
}

class _DepositeCurrencyState extends State<DepositeCurrency> {
  bool _isInProgress = false;

  var appBarheight = 0.0;

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    waitTime();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }

  waitTime() async {
    setState(() {
      _isInProgress = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isInProgress = false;
    });
  }

  @override
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

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
          elevation: 0,
          child: AppDrawer(
            selectItemName: 'deposite',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: !_isInProgress
          ? InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                color:
                                    AllCoustomTheme.getsecoundTextThemeColor(),
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
                        height: 25,
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'Deposite',
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
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),),
                                    border: Border.all(
                                      color: lightblue
                                    )
                                  ),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width / 2.5,
                                    height: 40,
                                    onPressed: () {

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) =>  Portfolio()),
                                      // );
                                    },
                                    shape: RoundedRectangleBorder(

                                    ),
                                    child: Text(
                                      "ERC20",
                                      style: TextStyle(
                                          fontSize: 13,

                                          color:lightblue )
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),),
                                      border: Border.all(
                                          color: lightblue
                                      )
                                  ),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width /2.5,
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
                                          fontSize: 16,
                                          color: lightblue),
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
                                left: 40, right: 40, top: 30,),
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
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AllCoustomTheme.getTextThemeColors(),
                                  ),
                                ),
                                Text(
                                  "Copy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AllCoustomTheme.getTextThemeColors(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: this._outputController,
                            maxLines: 2,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.wrap_text),
                              // helperText:
                              // 'The barcode or qrcode you scan will be displayed in this area.',
                              hintText:
                              'The barcode or qrcode you scan will be displayed in this area.',
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),


                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: lightblue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text("Save" , style: TextStyle(color: white),)),
                      )
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
    );
  }

  String btc = '';
  String usd = '';

  bool isShowingPopup = false;

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
              'You did succsessfully Request \$$btc BTC.\n and $usd',
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

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }
}
