
import 'package:CanuckCrypto/auth/LoginRegister.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(child: Image.asset('assets/Federick Logo Final.png', width: 400,height: 250,)),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elite, sed diam",

                textAlign: TextAlign.center,
                style: TextStyle(

                  color: black,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Container(),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(LoginRegister.routeName);
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [
                            darkblue,
                            lightblue,
                          ],
                        )),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome To App',
                          style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.arrow_forward, color: white,)
                      ],
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
