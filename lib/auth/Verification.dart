
import 'package:CanuckCrypto/auth/BasicInfo.dart';
import 'package:CanuckCrypto/auth/IdentityVerification.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/routes.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class Verification extends StatefulWidget {
  static const routeName = '/Verification';
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('CANUCKCRYPTO', style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 15 , color: black),),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height/1.15,
          padding: EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back , color: lightblue,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Verification', style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18 , color: black),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(child: Text('Code Will Be Sent to *******', style: TextStyle( fontSize: 13 , color: Colors.grey[600]),)),
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: darkblue,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,

                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        selectedColor: darkblue,
                        inactiveColor: white,
                        inactiveFillColor: white,
                        activeColor: darkblue,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor:
                        hasError ? Colors.blue.shade100 : Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.Home, (Route<dynamic> route) => false);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: lightblue,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("Submit", style: TextStyle(fontSize: 15,color: white),)),
                ),
              ),
             // SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
