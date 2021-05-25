import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/modules/BinanceProfile/BuyBinance.dart';
import 'package:CanuckCrypto/modules/BinanceProfile/SellBinance.dart';

class BinanceProfile extends StatefulWidget {
  @override
  _BinanceProfileState createState() => _BinanceProfileState();
}

class _BinanceProfileState extends State<BinanceProfile>with TickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightblue,
        leading: Icon(
          Icons.arrow_back_ios,
          color: white,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 130,
                color: lightblue,
                child: Padding(
                  padding: EdgeInsets.only( right: 15, left: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Container(
                          child: CircleAvatar(
                            child: Image.asset('assets/google.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Crypto_Fedric',
                              style: TextStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'Verified User',
                              style: TextStyle(fontSize: 11),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text('Email', style: TextStyle(fontSize: 12),),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.lightGreen,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('SMS', style: TextStyle(fontSize: 12),),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.lightGreen,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('KYC', style: TextStyle(fontSize: 12),),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.lightGreen,
                                  size: 15,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Info',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              'More >',
                              style: TextStyle(
                                fontSize: 13,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              '1602',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Text(
                              '96.45%',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              '30d Trades',
                              style: TextStyle(
                                fontSize: 12,
                                color: black,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Text(
                              '30d Compilatioj Rates',
                              style: TextStyle(
                                fontSize: 12,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.grey[100],
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Avg. Release Time',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '1.71 Minute',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Text(
                                      'Avg. Pay Time',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '5.21 Minute',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Feedback(178)',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              'Positive Feedback 98.00% >',
                              style: TextStyle(
                                fontSize: 13,
                                color: black,
                              ),
                            ),


                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                child: Image.asset(ConstanceData.planetImage),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('USB', style: TextStyle(fontSize: 13 ,  color: black),),
                                  Text('2021_04', style: TextStyle(fontSize: 11 ,  color: Colors.grey[300],))
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              child:Icon(Icons.thumb_up_alt_sharp , color: lightblue,),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                child: Image.asset(ConstanceData.planetImage),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('USB', style: TextStyle(fontSize: 13 ,  color: black),),
                                  Text('2021_04', style: TextStyle(fontSize: 11 ,  color: Colors.grey[300],))
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              child:Icon(Icons.thumb_up_alt_sharp , color: lightblue,),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TabBar(
                          controller: tabController,
                          indicator: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: darkblue.withOpacity(0.3),
                                ),
                              )),
                          tabs: [
                            Tab(
                              icon: Text(
                                "Buy coin",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Tab(
                                icon: Text(
                                  "Sell coin",
                                  style: TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                            //  BuyCoin(),
                              BuyBinance(),
                              SellBinance(),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
