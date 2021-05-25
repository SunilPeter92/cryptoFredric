import 'package:CanuckCrypto/modules/BinanceProfile/Sell_Coin.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/List/SellBinanceList.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/themes.dart';
class SellBinance extends StatefulWidget {
  @override
  _SellBinanceState createState() => _SellBinanceState();
}

class _SellBinanceState extends State<SellBinance> {
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
                    itemCount: sellList.length,
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
                                          sellList[index].image,
                                          fit: BoxFit.fill,
                                        )),
                                    Text(
                                      sellList[index].name,
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
                                      sellList[index].price.toString(),
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
                                      sellList[index].amount.toString(),
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
                                          sellList[index].startlimit.toString() +
                                          "-",
                                      style:
                                      TextStyle(color: black, fontSize: 12),
                                    ),

                                    Text(
                                      "Rs " +
                                          sellList[index].endlimit.toString(),
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
                                            MaterialPageRoute(builder: (context) =>Sell_Coin()),
                                          );
                                        },
                                        color: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text(
                                          "Sell",
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
