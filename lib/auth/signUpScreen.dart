import 'package:animator/animator.dart';
import '../auth/signInScreen.dart';
import '../constance/constance.dart';
import '../constance/routes.dart';
import '../constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constance/global.dart' as globals;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isInProgress = false;
  bool _isClickonSignIn = false;
  bool _visible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  animation() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _visible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    animation();
  }

  Widget customTextFields(
    String name,
    String hint,
    Function valid,
    TextEditingController controller,
  ) {
    return Column(
      children: [
        Container(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 22,
              color: AllCoustomTheme.getTextThemeColors(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: ConstanceData.primaryBlue.withOpacity(0.3),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: TextFormField(
            controller: controller,
            validator: valid,
            cursorColor: AllCoustomTheme.getTextThemeColors(),
            // scrollPadding: EdgeInsets.zero,
            style: TextStyle(
              fontSize: ConstanceData.SIZE_TITLE16,
              color: AllCoustomTheme.getTextThemeColors(),
            ),
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusColor: AllCoustomTheme.getTextThemeColors(),
              fillColor: AllCoustomTheme.getTextThemeColors(),
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.white, fontSize: ConstanceData.SIZE_TITLE14),
              // labelText: 'E-mail',
              // labelStyle: TextStyle(
              //   fontSize: ConstanceData.SIZE_TITLE16,
              //   color: AllCoustomTheme.getTextThemeColors(),
              // ),
            ),
            //controller: lastnameController,
            onSaved: (value) {
              setState(() {
                //lastnamesearchText = value;
              });
            },
          ),
        ),
      ],
    );
  }

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    double appBarheight = appBar.preferredSize.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Container(
              child: Text(
                "REGISTER",
                style: TextStyle(
                  fontSize: 22,
                  color: AllCoustomTheme.getTextThemeColors(),
                ),
              ),
            ),
            SizedBox(height: 50),
            Form(
              child: Column(
                children: [
                  customTextFields(
                    "Username",
                    "Enter your username",
                    (String val) {
                      val = _validateName(_emailController.text);
                    },
                    _nameController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  customTextFields(
                    "Email",
                    "Enter your Email",
                    (String val) {
                      val = _validateEmail(_emailController.text);
                    },
                    _emailController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  customTextFields(
                    "Password",
                    "Enter your password",
                    (String val) {
                      val = _validatePassword(_passwordController.text);
                    },
                    _passwordController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  customTextFields(
                    "Phone",
                    "Enter your phone no",
                    (String val) {
                      val = _validatePhone(_phoneController.text);
                    },
                    _phoneController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  customTextFields(
                    "Password",
                    "Enter your password",
                    (String val) {
                      val = _validatePassword(_passwordController.text);
                    },
                    _passwordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Login instead",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    minWidth: 500,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    color: ConstanceData.primaryBlue,
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: AllCoustomTheme.getTextThemeColors(
                              isContrast: true),
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // return Stack(
    //   children: <Widget>[
    //     Container(
    //       foregroundDecoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           colors: [
    //             HexColor(globals.primaryColorString).withOpacity(0.6),
    //             HexColor(globals.primaryColorString).withOpacity(0.6),
    //             HexColor(globals.primaryColorString).withOpacity(0.6),
    //             HexColor(globals.primaryColorString).withOpacity(0.6),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Scaffold(
    //       backgroundColor: AllCoustomTheme.getThemeData().primaryColor,
    //       body: ModalProgressHUD(
    //         inAsyncCall: _isInProgress,
    //         opacity: 0,
    //         progressIndicator: SizedBox(),
    //         child: SingleChildScrollView(
    //           physics: BouncingScrollPhysics(),
    //           child: Container(
    //             height: MediaQuery.of(context).size.height,
    //             child: GestureDetector(
    //               onTap: () {
    //                 FocusScope.of(context).requestFocus(new FocusNode());
    //               },
    //               child: Padding(
    //                 padding: const EdgeInsets.only(left: 16),
    //                 child: Column(
    //                   children: <Widget>[
    //                     SizedBox(
    //                       height: appBarheight,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: <Widget>[
    //                         InkWell(
    //                           onTap: () {
    //                             Navigator.of(context, rootNavigator: true).pop();
    //                           },
    //                           child: Animator(
    //                             tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(0.2, 0)),
    //                             duration: Duration(seconds: 1),
    //                             cycles: 0,
    //                             builder: (anim) => FractionalTranslation(
    //                               translation: anim.value,
    //                               child: Icon(
    //                                 Icons.arrow_back_ios,
    //                                 color: AllCoustomTheme.getTextThemeColors(),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         !_isClickonSignIn
    //                             ? GestureDetector(
    //                                 onTap: () async {
    //                                   setState(() {
    //                                     _isClickonSignIn = true;
    //                                   });
    //                                   await Future.delayed(const Duration(milliseconds: 700));

    //                                   Navigator.of(context, rootNavigator: true)
    //                                       .push(
    //                                     CupertinoPageRoute<void>(
    //                                       builder: (BuildContext context) => SignInScreen(),
    //                                     ),
    //                                   )
    //                                       .then((onValue) {
    //                                     setState(() {
    //                                       _isClickonSignIn = false;
    //                                     });
    //                                   });
    //                                 },
    //                                 child: Animator(
    //                                   tween: Tween<double>(begin: 0.8, end: 1.1),
    //                                   curve: Curves.easeInToLinear,
    //                                   cycles: 0,
    //                                   builder: (anim) => Transform.scale(
    //                                     scale: anim.value,
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.only(right: 16),
    //                                       child: Text(
    //                                         'Sign In',
    //                                         style: TextStyle(
    //                                           color: AllCoustomTheme.getTextThemeColors(),
    //                                           fontSize: ConstanceData.SIZE_TITLE18,
    //                                           fontWeight: FontWeight.bold,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               )
    //                             : Padding(
    //                                 padding: EdgeInsets.only(right: 14),
    //                                 child: CupertinoActivityIndicator(
    //                                   radius: 12,
    //                                 ),
    //                               )
    //                       ],
    //                     ),
    //                     SizedBox(
    //                       height: 40,
    //                     ),
    //                     Row(
    //                       children: <Widget>[
    //                         Animator(
    //                           tween: Tween<double>(begin: 0, end: 1),
    //                           duration: Duration(seconds: 1),
    //                           cycles: 1,
    //                           builder: (anim) => SizeTransition(
    //                             sizeFactor: anim,
    //                             axis: Axis.horizontal,
    //                             axisAlignment: 1,
    //                             child: Text(
    //                               'Sign Up',
    //                               style: TextStyle(
    //                                 color: AllCoustomTheme.getTextThemeColors(),
    //                                 fontSize: 36,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(
    //                       height: 20,
    //                     ),
    //                     _visible
    //                         ? Container(
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
    //                               color: AllCoustomTheme.boxColor(),
    //                             ),
    //                             child: Form(
    //                               key: _formKey,
    //                               child: Column(
    //                                 children: <Widget>[
    //                                   SizedBox(
    //                                     height: 0.5,
    //                                   ),
    //                                   Container(
    //                                     height: 5,
    //                                     width: double.infinity,
    //                                     decoration: BoxDecoration(
    //                                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(2)),
    //                                       gradient: LinearGradient(
    //                                         begin: Alignment.topLeft,
    //                                         end: Alignment.bottomRight,
    //                                         colors: [
    //                                           globals.buttoncolor1,
    //                                           globals.buttoncolor2,
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   Container(
    //                                     height: 60,
    //                                     color: AllCoustomTheme.getsecoundTextThemeColor(),
    //                                     padding: EdgeInsets.all(10),
    //                                     child: Row(
    //                                       children: <Widget>[
    //                                         Image.asset(
    //                                           ConstanceData.userImage,
    //                                         ),
    //                                         SizedBox(
    //                                           width: 8,
    //                                         ),
    //                                         Text(
    //                                           'Select photo',
    //                                           style: TextStyle(
    //                                             fontWeight: FontWeight.bold,
    //                                           ),
    //                                         )
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   Row(
    //                                     children: <Widget>[
    //                                       Expanded(
    //                                         child: Padding(
    //                                           padding: EdgeInsets.only(left: 14, top: 4),
    //                                           child: TextFormField(
    //                                             validator: _validateName,
    //                                             cursorColor: AllCoustomTheme.getTextThemeColors(),
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.bold,
    //                                               fontSize: ConstanceData.SIZE_TITLE16,
    //                                               color: AllCoustomTheme.getTextThemeColors(),
    //                                             ),
    //                                             keyboardType: TextInputType.text,
    //                                             decoration: new InputDecoration(
    //                                               focusColor: AllCoustomTheme.getTextThemeColors(),
    //                                               fillColor: AllCoustomTheme.getTextThemeColors(),
    //                                               hintText: 'Enter name here...',
    //                                               hintStyle: TextStyle(color: Colors.grey[600], fontSize: ConstanceData.SIZE_TITLE14),
    //                                               labelText: 'Name',
    //                                               labelStyle: TextStyle(
    //                                                 fontSize: ConstanceData.SIZE_TITLE16,
    //                                                 color: AllCoustomTheme.getTextThemeColors(),
    //                                               ),
    //                                             ),
    //                                             //controller: lastnameController,
    //                                             onSaved: (value) {
    //                                               setState(() {
    //                                                 //lastnamesearchText = value;
    //                                               });
    //                                             },
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   SizedBox(
    //                                     height: 10,
    //                                   ),
    //                                   Row(
    //                                     children: <Widget>[
    //                                       Expanded(
    //                                         child: Padding(
    //                                           padding: EdgeInsets.only(left: 14, top: 4),
    //                                           child: TextFormField(
    //                                             validator: _validateEmail,
    //                                             cursorColor: AllCoustomTheme.getTextThemeColors(),
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.bold,
    //                                               fontSize: ConstanceData.SIZE_TITLE16,
    //                                               color: AllCoustomTheme.getTextThemeColors(),
    //                                             ),
    //                                             keyboardType: TextInputType.text,
    //                                             decoration: new InputDecoration(
    //                                               focusColor: AllCoustomTheme.getTextThemeColors(),
    //                                               fillColor: AllCoustomTheme.getTextThemeColors(),
    //                                               hintText: 'Enter email here...',
    //                                               hintStyle: TextStyle(color: Colors.grey[600], fontSize: ConstanceData.SIZE_TITLE14),
    //                                               labelText: 'E-mail',
    //                                               labelStyle: TextStyle(
    //                                                 fontSize: ConstanceData.SIZE_TITLE16,
    //                                                 color: AllCoustomTheme.getTextThemeColors(),
    //                                               ),
    //                                             ),
    //                                             //controller: lastnameController,
    //                                             onSaved: (value) {
    //                                               setState(() {
    //                                                 //lastnamesearchText = value;
    //                                               });
    //                                             },
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   SizedBox(
    //                                     height: 10,
    //                                   ),
    //                                   Row(
    //                                     children: <Widget>[
    //                                       Expanded(
    //                                         child: Padding(
    //                                           padding: EdgeInsets.only(left: 14, bottom: 10),
    //                                           child: TextFormField(
    //                                             cursorColor: AllCoustomTheme.getTextThemeColors(),
    //                                             style: TextStyle(
    //                                               fontWeight: FontWeight.bold,
    //                                               fontSize: ConstanceData.SIZE_TITLE16,
    //                                               color: AllCoustomTheme.getTextThemeColors(),
    //                                             ),
    //                                             keyboardType: TextInputType.text,
    //                                             obscureText: true,
    //                                             decoration: new InputDecoration(
    //                                               focusColor: AllCoustomTheme.getTextThemeColors(),
    //                                               fillColor: AllCoustomTheme.getTextThemeColors(),
    //                                               hintText: 'Enter password here...',
    //                                               hintStyle: TextStyle(color: Colors.grey[600], fontSize: ConstanceData.SIZE_TITLE14),
    //                                               labelText: 'Password',
    //                                               labelStyle: TextStyle(
    //                                                 fontSize: ConstanceData.SIZE_TITLE16,
    //                                                 color: AllCoustomTheme.getTextThemeColors(),
    //                                               ),
    //                                             ),
    //                                             validator: _validatePassword,
    //                                             //controller: lastnameController,
    //                                             onSaved: (value) {
    //                                               setState(() {
    //                                                 //lastnamesearchText = value;
    //                                               });
    //                                             },
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   SizedBox(
    //                                     height: 10,
    //                                   ),
    //                                   Padding(
    //                                     padding: const EdgeInsets.only(bottom: 20, left: 14, right: 10),
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       children: <Widget>[
    //                                         SizedBox(
    //                                           height: 50,
    //                                           child: !_isInProgress
    //                                               ? GestureDetector(
    //                                                   onTap: () {
    //                                                     _submit();
    //                                                   },
    //                                                   child: Animator(
    //                                                     tween: Tween<double>(begin: 0.8, end: 1.1),
    //                                                     curve: Curves.easeInToLinear,
    //                                                     cycles: 0,
    //                                                     builder: (anim) => Transform.scale(
    //                                                       scale: anim.value,
    //                                                       child: Container(
    //                                                         height: 50,
    //                                                         width: 50,
    //                                                         decoration: BoxDecoration(
    //                                                           border: new Border.all(color: Colors.white, width: 1.5),
    //                                                           shape: BoxShape.circle,
    //                                                           gradient: LinearGradient(
    //                                                             begin: Alignment.topLeft,
    //                                                             end: Alignment.bottomRight,
    //                                                             colors: [
    //                                                               globals.buttoncolor1,
    //                                                               globals.buttoncolor2,
    //                                                             ],
    //                                                           ),
    //                                                         ),
    //                                                         child: Padding(
    //                                                           padding: const EdgeInsets.only(left: 3),
    //                                                           child: Icon(
    //                                                             Icons.arrow_forward_ios,
    //                                                             size: 20,
    //                                                             color: AllCoustomTheme.getTextThemeColors(),
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 )
    //                                               : Padding(
    //                                                   padding: EdgeInsets.only(right: 14),
    //                                                   child: CupertinoActivityIndicator(
    //                                                     radius: 12,
    //                                                   ),
    //                                                 ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                             ),
    //                           )
    //                         : SizedBox(),
    //                     _visible
    //                         ? Expanded(
    //                             child: Stack(
    //                               alignment: Alignment.bottomCenter,
    //                               children: <Widget>[
    //                                 Text(
    //                                   'Terms & Privacy Policy',
    //                                   style: TextStyle(
    //                                     color: AllCoustomTheme.getsecoundTextThemeColor(),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           )
    //                         : SizedBox()
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }

  var myScreenFocusNode = FocusNode();

  _submit() async {
    setState(() {
      _isInProgress = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));

    FocusScope.of(context).requestFocus(myScreenFocusNode);
    if (_formKey.currentState.validate() == false) {
      setState(() {
        _isInProgress = false;
      });
      return;
    }
    _formKey.currentState.save();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.Home, (Route<dynamic> route) => false);
  }

  String _validateName(value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    }
    return null;
  }

  String _validateEmail(value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    } else if (Validators.validateEmail(value) == false) {
      return "Please enter valid email";
    }
    return null;
  }

  String _validatePhone(value) {
    if (value.isEmpty) {
      return "Phone cannot be empty";
    } else if (value.length < 11) {
      return 'Invalid phone no';
    } else {
      return null;
    }
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 5) {
      return 'Password must contains ${5} characters';
    } else {
      return null;
    }
  }
}
