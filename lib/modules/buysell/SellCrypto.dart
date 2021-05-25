import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/buysell/SelectCard.dart';
import 'package:CanuckCrypto/modules/buysell/SelectReceiveMethod.dart';
import 'package:flutter/material.dart';

class SellCrypto extends StatefulWidget {
  @override
  _SellCryptoState createState() => _SellCryptoState();
}

class _SellCryptoState extends State<SellCrypto> {
  var formkey = GlobalKey<FormState>();
  final nocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "Sell Crypto",
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontSize: ConstanceData.SIZE_TITLE18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '1BTC = 4,125.541.55',
                style: TextStyle(color: black),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text('Buy Max' , style: TextStyle(color: black),),
                  // SizedBox(width: 30,),
                  Container(
                    width: 100,
                    child: TextFormField(
                      controller: nocontroller,
                      validator: (value) {
                        if (value.isEmpty || int.parse(value) > 10) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: '0'),
                    ),
                  ),
                  Text(
                    'BTC',
                    style: TextStyle(color: black, fontSize: 25),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Max Limit to Sell',
                    style: TextStyle(color: black, fontSize: 11),
                  ),
                  Text(
                    '10 BNB',
                    style: TextStyle(color: black),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 50,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Available: 0 BTC',style: TextStyle(color: black, fontSize: 18),),
              //     Text('MAX',style: TextStyle(color: black , fontSize: 12),),
              //   ],
              // ),
              Spacer(),
              InkWell(
                onTap: () {
                  if (formkey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectReceiveMethod()),
                    );
                  }

                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      color: lightblue, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        ' Sell ',
                        style: TextStyle(color: white),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
