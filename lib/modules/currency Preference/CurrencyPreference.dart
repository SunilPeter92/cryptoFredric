import 'package:CanuckCrypto/Global/Global.dart';
import 'package:CanuckCrypto/api/apiProvider.dart';
import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/model/CurrencyRateModel.dart';
import 'package:CanuckCrypto/model/ProviderModel.dart';
import 'package:CanuckCrypto/modules/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyPreference extends StatefulWidget {
  const CurrencyPreference({Key key}) : super(key: key);

  @override
  _CurrencyPreferenceState createState() => _CurrencyPreferenceState();
}

class _CurrencyPreferenceState extends State<CurrencyPreference> {
  var height = 0.0;

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75 < 400
            ? MediaQuery.of(context).size.width * 0.75
            : 350,
        child: Drawer(
          elevation: 0,
          child: AppDrawer(
            selectItemName: 'home',
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(
                      Icons.sort,
                      color: AllCoustomTheme.getsecoundTextThemeColor(),
                    ),
                  ),
                  Spacer(),
                  Container(
                    // height: 40 ,
                    // width: 40,
                    child: Image.asset(
                      'assets/fedriclogo.png',
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Currency Preference',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                        fontWeight: FontWeight.bold,
                        fontSize: ConstanceData.SIZE_TITLE25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: FutureBuilder<CurrencyRateModel>(
                  future: ApiProvider().Currency(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 120,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, left: 30),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Consumer<MyModel>( //                    <--- Consumer
                                  builder: (context, myModel, child) {
                                    return InkWell(
                                      onTap: () {
                                        myModel.doSomething(double.parse(snapshot.data.rates.eUR));
                                        // setState(() {
                                        //   Global.currencyname =
                                        //       snapshot.data.rates.eUR;
                                        // });
                                        print(
                                            'Select currency: ${snapshot.data
                                                .rates.eUR}');
                                      },
                                      child: Text(
                                        snapshot.data.rates.eUR,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                      ),
                                    );
                                  }
                                  ),
                                   SizedBox(
                                    height: 10,
                                  ),
                                  Consumer<MyModel>( //                    <--- Consumer
                                      builder: (context, myModel, child) {
                                        return InkWell(
                                          onTap: () {
                                            myModel.doSomething(double.parse(snapshot.data.rates.gBP));
                                            // setState(() {
                                            //   Global.currencyname =
                                            //       snapshot.data.rates.gBP;
                                            // });
                                            print(
                                                'Select currency: ${snapshot.data
                                                    .rates.gBP}');
                                          },
                                          child: Text(
                                            snapshot.data.rates.gBP,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                          ),
                                        );
                                      }
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       Global.currencyname =
                                  //           snapshot.data.rates.gBP;
                                  //     });
                                  //     print(
                                  //         'Select currency: ${snapshot.data.rates.gBP}');
                                  //   },
                                  //   child: Text(
                                  //     snapshot.data.rates.gBP,
                                  //     style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 12,
                                  //         fontWeight: FontWeight.w500),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Consumer<MyModel>( //                    <--- Consumer
                                      builder: (context, myModel, child) {
                                        return InkWell(
                                          onTap: () {
                                            myModel.doSomething(double.parse(snapshot.data.rates.pKR));
                                            // setState(() {
                                            //   Global.currencyname =
                                            //       snapshot.data.rates.pKR;
                                            // });
                                            print(
                                                'Select currency: ${snapshot.data
                                                    .rates.pKR}');
                                          },
                                          child: Text(
                                            snapshot.data.rates.pKR,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                          ),
                                        );
                                      }
                                  ),
                                  // InkWell(
                                  //   onTap: (){
                                  //     setState(() {
                                  //     Global.currencyname =
                                  //         snapshot.data.rates.pKR;
                                  //   });
                                  //   print(
                                  //       'Select currency: ${snapshot.data.rates.pKR}');},
                                  //   child: Text(
                                  //     snapshot.data.rates.pKR,
                                  //     style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 12,
                                  //         fontWeight: FontWeight.w500),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Consumer<MyModel>( //                    <--- Consumer
                                      builder: (context, myModel, child) {
                                        return InkWell(
                                          onTap: () {
                                            myModel.doSomething(double.parse( snapshot.data.rates.uSD));
                                            // setState(() {
                                            //   Global.currencyname =
                                            //       snapshot.data.rates.uSD;
                                            // });
                                            print(
                                                'Select currency: ${snapshot.data
                                                    .rates.uSD}');
                                          },
                                          child: Text(
                                            snapshot.data.rates.uSD,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                          ),
                                        );
                                      }
                                  ),
                                  // InkWell(
                                  //   onTap: (){
                                  //     setState(() {
                                  //       Global.currencyname =
                                  //           snapshot.data.rates.uSD;
                                  //     });
                                  //     print(
                                  //         'Select currency: ${snapshot.data.rates.uSD}');
                                  //   },
                                  //   child: Text(
                                  //     snapshot.data.rates.uSD,
                                  //     style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 12,
                                  //         fontWeight: FontWeight.w500),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner
                    return Container();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
