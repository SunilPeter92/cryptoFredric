import 'package:flutter/material.dart';
import 'package:CanuckCrypto/List/BuyBinanceList.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/BinanceProfile/Buy_Coin.dart';

class BuyBinance extends StatefulWidget {
  @override
  _BuyBinanceState createState() => _BuyBinanceState();
}

class _BuyBinanceState extends State<BuyBinance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                    itemCount: buyList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => DepositeCurrency()),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            // color: black,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Image.asset(
                                          buyList[index].image,
                                          fit: BoxFit.fill,
                                        )),
                                    Text(
                                      buyList[index].name,
                                      style: TextStyle(
                                        color: black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Price : ',
                                      style:
                                          TextStyle(color: black, fontSize: 12),
                                    ),
                                    Text(
                                      buyList[index].price.toString(),
                                      style:
                                          TextStyle(color: black, fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Amount : ',
                                      style:
                                          TextStyle(color: black, fontSize: 12),
                                    ),
                                    Text(
                                      buyList[index].amount.toString(),
                                      style:
                                          TextStyle(color: black, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Limit  : ',
                                      style:
                                          TextStyle(fontSize: 12, color: black),
                                    ),
                                    Text(
                                      "Rs " +
                                          buyList[index].startlimit.toString() +
                                          "-",
                                      style:
                                          TextStyle(color: black, fontSize: 12),
                                    ),

                                    Text(
                                      "Rs " +
                                          buyList[index].endlimit.toString(),
                                      style:
                                          TextStyle(color: black, fontSize: 12),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: MaterialButton(
                                        minWidth: 50,

                                        onPressed: () {

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  Buy_Coin()),
                                          );
                                        },
                                        color: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          "Buy",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: AllCoustomTheme.getTextThemeColors(
                                                  isContrast: true)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

