import 'dart:ui';

import 'package:CanuckCrypto/auth/signUpScreen.dart';
import 'package:animator/animator.dart';
import '../auth/signInScreen.dart';
import '../constance/constance.dart';
import '../constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constance/global.dart' as globals;
import 'package:gradient_text/gradient_text.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'selectAuthScreen.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _visible = false;
  bool _visiblesignUpbutton = false;
  bool _isInProgress = false;

  animationText() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _visible = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _visiblesignUpbutton = true;
    });
  }

  @override
  void initState() {
    super.initState();
    animationText();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          // Container(
          //   foregroundDecoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         HexColor(globals.primaryColorString).withOpacity(0.9),
          //         HexColor(globals.primaryColorString).withOpacity(0.8),
          //         HexColor(globals.primaryColorString).withOpacity(0.7),
          //         HexColor(globals.primaryColorString).withOpacity(0.6),
          //       ],
          //     ),
          //   ),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //     child: Image.asset(
          //       ConstanceData.authImage,
          //       alignment: Alignment.center,
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Scaffold(
            backgroundColor: Colors.white,
            body: ModalProgressHUD(
                inAsyncCall: _isInProgress,
                opacity: 0,
                progressIndicator: SizedBox(),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "LOGO HERE",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 140,
                      ),
                      Container(
                        // color: Colors.green,
                        height: 120,
                        child: Column(
                          children: [
                            MaterialButton(
                              minWidth: 300,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    50,
                                  ),
                                ),
                              ),
                              color: ConstanceData.primaryBlue,
                              onPressed: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              minWidth: 300,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    50,
                                  ),
                                ),
                              ),
                              color: ConstanceData.primaryBlue,
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  CupertinoPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                )
                // child: Padding(
                //   padding: EdgeInsets.only(right: 16, bottom: 20, left: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       AnimatedOpacity(
                //         duration: Duration(milliseconds: 500),
                //         opacity: _visible ? 1.0 : 0.0,
                //         child: Text(
                //           'Safest digital \nblockchain \nplatform',
                //           style: TextStyle(
                //             color: AllCoustomTheme.getTextThemeColors(),
                //             fontSize: 38,
                //             letterSpacing: 0.8,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       _visible
                //           ? AnimatedOpacity(
                //               duration: Duration(milliseconds: 500),
                //               opacity: _visiblesignUpbutton ? 1.0 : 0.0,
                //               child: FlatButton(
                //                 padding: EdgeInsets.all(0),
                //                 child: Container(
                //                   height: 45.0,
                //                   alignment: FractionalOffset.center,
                //                   decoration: BoxDecoration(
                //                     border: Border.all(color: Colors.white, width: 1.5),
                //                     borderRadius: BorderRadius.circular(30),
                //                     gradient: LinearGradient(
                //                       begin: Alignment.topLeft,
                //                       end: Alignment.bottomRight,
                //                       colors: [
                //                         globals.buttoncolor1,
                //                         globals.buttoncolor2,
                //                       ],
                //                     ),
                //                   ),
                //                   child: Text(
                //                     "Sign Up With E-Mail",
                //                     style: TextStyle(
                //                       color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                //                       letterSpacing: 0.3,
                //                     ),
                //                   ),
                //                 ),
                //                 onPressed: () async {
                //                   setState(() {
                //                     _isInProgress = true;
                //                   });
                //                   await Future.delayed(const Duration(seconds: 1));
                //                   Navigator.of(context)
                //                       .push(
                //                     CupertinoPageRoute<void>(
                //                       builder: (BuildContext context) => SelectAuthScreen(),
                //                     ),
                //                   )
                //                       .then((onValue) {
                //                     setState(() {
                //                       _isInProgress = false;
                //                     });
                //                   });
                //                 },
                //               ),
                //             )
                //           : SizedBox(
                //               height: 48,
                //             ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       _visible
                //           ? Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: <Widget>[
                //                 Text(
                //                   'or use socials',
                //                   style: TextStyle(
                //                     color: AllCoustomTheme.getTextThemeColors(),
                //                     fontSize: ConstanceData.SIZE_TITLE14,
                //                   ),
                //                 ),
                //               ],
                //             )
                //           : SizedBox(),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       _visible
                //           ? AnimatedOpacity(
                //               duration: Duration(milliseconds: 500),
                //               opacity: _visiblesignUpbutton ? 1.0 : 0.0,
                //               child: FlatButton(
                //                 padding: EdgeInsets.all(0),
                //                 child: new Container(
                //                   height: 45.0,
                //                   alignment: FractionalOffset.center,
                //                   decoration: BoxDecoration(
                //                     borderRadius: new BorderRadius.circular(30),
                //                     color: AllCoustomTheme.getTextThemeColors(),
                //                   ),
                //                   child: GradientText(
                //                     "Facebook",
                //                     gradient: LinearGradient(
                //                       begin: Alignment.topLeft,
                //                       end: Alignment.bottomRight,
                //                       colors: [
                //                         globals.buttoncolor1,
                //                         globals.buttoncolor2,
                //                       ],
                //                     ),
                //                     style: new TextStyle(
                //                       letterSpacing: 0.3,
                //                     ),
                //                   ),
                //                 ),
                //                 onPressed: () async {
                //                   setState(() {
                //                     _isInProgress = true;
                //                   });
                //                   await Future.delayed(const Duration(seconds: 1));
                //                   Navigator.of(context)
                //                       .push(
                //                     CupertinoPageRoute<void>(
                //                       builder: (BuildContext context) => SelectAuthScreen(),
                //                     ),
                //                   )
                //                       .then((onValue) {
                //                     setState(() {
                //                       _isInProgress = false;
                //                     });
                //                   });
                //                 },
                //               ),
                //             )
                //           : SizedBox(
                //               height: 48,
                //             ),
                //       SizedBox(
                //         height: 4,
                //       ),
                //       _visible
                //           ? AnimatedOpacity(
                //               duration: Duration(milliseconds: 500),
                //               opacity: _visiblesignUpbutton ? 1.0 : 0.0,
                //               child: FlatButton(
                //                 padding: EdgeInsets.all(0),
                //                 child: new Container(
                //                   height: 45.0,
                //                   alignment: FractionalOffset.center,
                //                   decoration: BoxDecoration(
                //                     borderRadius: new BorderRadius.circular(30),
                //                     color: AllCoustomTheme.getTextThemeColors(),
                //                   ),
                //                   child: GradientText(
                //                     "Twitter",
                //                     gradient: LinearGradient(
                //                       begin: Alignment.topLeft,
                //                       end: Alignment.bottomRight,
                //                       colors: [
                //                         globals.buttoncolor1,
                //                         globals.buttoncolor2,
                //                       ],
                //                     ),
                //                     style: new TextStyle(
                //                       letterSpacing: 0.3,
                //                     ),
                //                   ),
                //                 ),
                //                 onPressed: () async {
                //                   setState(() {
                //                     _isInProgress = true;
                //                   });
                //                   await Future.delayed(const Duration(seconds: 1));
                //                   Navigator.of(context)
                //                       .push(
                //                     CupertinoPageRoute<void>(
                //                       builder: (BuildContext context) => SelectAuthScreen(),
                //                     ),
                //                   )
                //                       .then((onValue) {
                //                     setState(() {
                //                       _isInProgress = false;
                //                     });
                //                   });
                //                 },
                //               ),
                //             )
                //           : SizedBox(
                //               height: 48,
                //             ),
                //       SizedBox(
                //         height: 14,
                //       ),
                //       _visible
                //           ? Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: <Widget>[
                //                 GestureDetector(
                //                   onTap: () async {
                //                     setState(() {
                //                       _isInProgress = true;
                //                     });
                //                     await Future.delayed(const Duration(seconds: 1));
                //                     Navigator.of(context)
                //                         .push(
                //                       CupertinoPageRoute<void>(
                //                         builder: (BuildContext context) => SignInScreen(),
                //                       ),
                //                     )
                //                         .then((onValue) {
                //                       setState(() {
                //                         _isInProgress = false;
                //                       });
                //                     });
                //                   },
                //                   child: Container(
                //                     height: 20,
                //                     child: !_isInProgress
                //                         ? Animator(
                //                             tween: Tween<double>(begin: 0.8, end: 1),
                //                             curve: Curves.easeInToLinear,
                //                             cycles: 0,
                //                             builder: (anim) => Transform.scale(
                //                               scale: anim.value,
                //                               child: Text(
                //                                 'Sign in with E-Mail',
                //                                 style: TextStyle(
                //                                   fontSize: ConstanceData.SIZE_TITLE18,
                //                                   color: AllCoustomTheme.getTextThemeColors(),
                //                                 ),
                //                               ),
                //                             ),
                //                           )
                //                         : Row(
                //                             mainAxisAlignment: MainAxisAlignment.center,
                //                             children: <Widget>[
                //                               CupertinoActivityIndicator(
                //                                 radius: 12,
                //                               ),
                //                             ],
                //                           ),
                //                   ),
                //                 ),
                //               ],
                //             )
                //           : SizedBox(),
                //     ],
                //   ),
                // ),
                ),
          )
        ],
      ),
    );
  }
}
