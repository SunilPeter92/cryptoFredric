import 'package:CanuckCrypto/auth/BasicInfo.dart';
import 'package:CanuckCrypto/auth/IdCardVerification.dart';
import 'package:CanuckCrypto/auth/LoginRegister.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class EmailVerification extends StatefulWidget {
  static const routeName = '/EmailVerification';
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading:   InkWell( onTap:(){ Navigator.pop(context);} ,child: Icon(Icons.arrow_back, color: lightblue)),
        title:   Text(
          'Email Verification',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: black),
        ),
        centerTitle: true,
        // actions: [
        //   Text(
        //     'CANUCKCRYPTO',
        //     style: TextStyle(
        //         fontWeight: FontWeight.w500, fontSize: 12, color: black),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height/1.25,
          padding: EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Container(child:  Image.asset('assets/Email.png', width: 300,height: 200,)),
              SizedBox(height: 50,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Enter Verification Code',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20, color: black),
                  ),
                ),
              ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Verification code sent to your Registered Email',
                    style: TextStyle(fontSize: 13, color: black),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: Container(
              //     height: 50,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         border: Border.all(color: lightblue)),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         border: InputBorder.none,
              //         focusedBorder: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         errorBorder: InputBorder.none,
              //         disabledBorder: InputBorder.none,
              //         hintText: 'Enter Code',
              //         contentPadding: EdgeInsets.only(
              //             left: 15, bottom: 11, top: 11, right: 15),
              //
              //
              //       ),
              //       style: TextStyle(fontSize: 15),
              //     ),
              //   ),
              // ),
              PinEntryTextField(
                onSubmit: (String pin){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Pin"),
                          content: Text('Pin entered is $pin'),
                        );
                      }
                  ); //end showDialog()

                }, // end onSubmit
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IdCardVerification ()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: lightblue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 15, color: white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
