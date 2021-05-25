import 'package:CanuckCrypto/auth/VerifyKyc.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/routes.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/home/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddressVeri extends StatefulWidget {
  @override
  _AddressVeriState createState() => _AddressVeriState();
}

class _AddressVeriState extends State<AddressVeri> {
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
                  Text(
                    'CANUCKCRYPTO',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: lightblue,
            ),
            Text(
              'Address Verification Complete',
              style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
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
                    "OK",
                    style: TextStyle(
                        fontSize: 13,
                        color: AllCoustomTheme.getTextThemeColors(
                            isContrast: true)),
                  ),
                ),
              ),
            ),
          ],
        )
            : SizedBox(),
      ),
    );
  }
}
