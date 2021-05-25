import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
class SellCoin extends StatefulWidget {
  @override
  _SellCoinState createState() => _SellCoinState();
}
String dropDownSelectedValue1 = "Bitcoin (BTC)";
String dropDownSelectedValue2 = "BTC/USD";
int _groupValue = -1;

class _SellCoinState extends State<SellCoin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Choose what you want to sell",
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ConstanceData.primaryBlue.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: DropdownButton(
                    underline: Container(),
                    iconDisabledColor: ConstanceData.primaryBlue,
                    iconEnabledColor: ConstanceData.primaryBlue,

                    isExpanded: true,
                    // Not necessary for Option 1
                    isDense: false,
                    value: dropDownSelectedValue1,
                    onChanged: (newValue) {
                      setState(() {
                        dropDownSelectedValue1 = newValue;
                      });
                    },
                    items: ["Bitcoin (BTC)", "Ethereum (ETH)", "Litecoin (LTC)"]
                        .map((location) {
                      return DropdownMenuItem(
                        child: new Text(
                          location,
                          style: TextStyle(fontSize: 16),
                        ),
                        value: location,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Amount to Sell",
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ConstanceData.primaryBlue.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 180,
                        child: Theme(
                          data:
                          ThemeData(focusColor: ConstanceData.primaryBlue),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 5,
                            textAlign: TextAlign.left,
                            autofocus: false,
                            initialValue: '',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0.000000000',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                              counterText: "",
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 100,
                        child: DropdownButton(
                          underline: Container(),
                          iconDisabledColor: ConstanceData.primaryBlue,
                          iconEnabledColor: ConstanceData.primaryBlue,

                          isExpanded: true,
                          // Not necessary for Option 1
                          isDense: false,
                          value: dropDownSelectedValue2,
                          onChanged: (newValue) {
                            setState(() {
                              dropDownSelectedValue2 = newValue;
                            });
                          },
                          items: [
                            "BTC/USD",
                            "BTC/INR",
                            "BTC/CAD",
                          ].map((location) {
                            return DropdownMenuItem(
                              child: new Text(
                                location,
                                style: TextStyle(fontSize: 16),
                              ),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Minimum 10.00 USD",
                        style: TextStyle(
                          color: ConstanceData.primaryBlue.withOpacity(0.3),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "1USD = 0.000016 BTC",
                        style: TextStyle(
                          color: ConstanceData.primaryBlue.withOpacity(0.3),
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Payment Method",
                    style:
                    TextStyle(color: AllCoustomTheme.getTextThemeColors()),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      _myRadioButton(
                        title: "Paypal",
                        value: 0,
                        onChanged: (newValue) =>
                            setState(() => _groupValue = newValue),
                      ),
                      _myRadioButton(
                        title: "Interac",
                        value: 1,
                        onChanged: (newValue) =>
                            setState(() => _groupValue = newValue),
                      ),
                      _myRadioButton(
                        title: "Credit/Debit Card",
                        value: 3,
                        onChanged: (newValue) =>
                            setState(() => _groupValue = newValue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        // highlightColor: Colors.transparent,
                        // splashColor: Colors.transparent,
                        onTap: () {
                          // showCupertinoModalPopup<void>(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return Padding(
                          //       padding: const EdgeInsets.only(left: 10, right: 10),
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(10),
                          //             color:  lightblue),
                          //         height: MediaQuery.of(context).size.height/2,
                          //         child: Scaffold(
                          //           backgroundColor: Colors.transparent,
                          //           body: BuyPopup(),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 40,
                          decoration: BoxDecoration(
                            color: lightblue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sell",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AllCoustomTheme.getTextThemeColors(
                                      isContrast: true)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Note: Our transfer included",
                          style:
                          TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      // contentPadding: EdgeInsets.zero,
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
