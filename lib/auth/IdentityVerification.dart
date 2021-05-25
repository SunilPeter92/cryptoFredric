import 'package:CanuckCrypto/auth/BasicInfo.dart';
import 'package:CanuckCrypto/auth/EmailVerification.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class IdentityVerification extends StatefulWidget {
  static const routeName = '/IdentityVerification';
  @override
  _IdentityVerificationState createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading:   Icon(Icons.arrow_back, color: lightblue),
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
              Container(child: Image.asset('assets/Email.png', width: 300,height: 200,)),
              SizedBox(height: 50,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Enter your Email',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20, color: black),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Enter your Registered Email',
                    style: TextStyle(fontSize: 13, color: black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: lightblue)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                     hintText: 'Enter Email',
                        contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),


                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 50, left: 20),
              //   child: Text(
              //     'Basic Information',
              //     style: TextStyle(
              //         fontSize: 17, color: black, fontWeight: FontWeight.w400),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10, left: 30),
              //   child: Text(
              //     'First and Last name',
              //     style: TextStyle(
              //       fontSize: 13,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10, left: 30),
              //   child: Text(
              //     'Date of Birth',
              //     style: TextStyle(
              //       fontSize: 13,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10, left: 30),
              //   child: Text(
              //     'Residential address',
              //     style: TextStyle(
              //       fontSize: 13,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(EmailVerification.routeName);
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
