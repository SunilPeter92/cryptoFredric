import 'dart:async';

import 'package:CanuckCrypto/auth/EmailVerification.dart';
import 'package:CanuckCrypto/auth/IdentityVerification.dart';
import 'package:CanuckCrypto/auth/LoginRegister.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/splash/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreens extends StatefulWidget {
  static const routeName = '/SplashScreens';
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    Timer(new Duration(seconds: 5), () {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginRegister()),
        );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            darkblue,
            lightblue,
          ],
        )),
        child: Center(
            child: Image.asset(
              'assets/Federick Splash Logo.png',
              width: 300,
              height: 300,
            )),
      ),
    );
  }
}
