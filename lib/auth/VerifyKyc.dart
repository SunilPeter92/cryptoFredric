import 'package:CanuckCrypto/auth/BasicInfo.dart';
import 'package:CanuckCrypto/auth/Identify_Address.dart';
import 'package:CanuckCrypto/auth/ImageVerification.dart';
import 'package:CanuckCrypto/modules/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/constance/Colors.dart';

class VerifyKyc extends StatefulWidget {
  @override
  _VerifyKycState createState() => _VerifyKycState();
}

class _VerifyKycState extends State<VerifyKyc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(Icons.arrow_back, color: lightblue)),
        title: Text(
          'Verification',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: EdgeInsets.only(left: 15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Text(
                          'Identity Verification',
                          style: TextStyle(color: black),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.account_circle_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Personal Information',
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Why Verify Your Identity',
                          style: TextStyle(color: black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'To Increase Your WithDraw Limit to 100 BTC',
                              style: TextStyle(
                                  color: Colors.grey[300], fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.27,
                                child: Text(
                                  'To Increase Your Deposit Limit for selected local Currencies',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 12,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BasicInfo()),
                            );
                          },
                          child: Center(
                            child: Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: lightblue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ))),
                          ),
                        )
                      ],
                    )),
              ),
              Card(
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: EdgeInsets.only(left: 15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Text(
                          'Additional Verification',
                          style: TextStyle(color: black),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.account_circle_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Address Verification',
                              style: TextStyle(color: black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Why include your residential address?',
                          style: TextStyle(color: black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.27,
                                child: Text(
                                  'Further Increase Deposit Limit for some local Currencies',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 12,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Address_Identify()),
                            );
                          },
                          child: Center(
                            child: Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: lightblue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ))),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
