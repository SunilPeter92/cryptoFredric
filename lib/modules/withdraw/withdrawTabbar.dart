import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/buysell/buysell.dart';
import 'package:CanuckCrypto/modules/drawer/drawer.dart';
import 'package:CanuckCrypto/modules/withdraw/WithDraw.dart';
import 'package:CanuckCrypto/modules/withdraw/WithDrawCoin.dart';
import 'package:CanuckCrypto/modules/withdraw/withDrawFiat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class WithDrawTabbar extends StatefulWidget {
  @override
  _WithDrawTabbarState createState() => _WithDrawTabbarState();
}

class _WithDrawTabbarState extends State<WithDrawTabbar> {
  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;
  bool _isInProgress = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75 < 400
            ? MediaQuery.of(context).size.width * 0.75
            : 350,
        child: Drawer(
          child: AppDrawer(
            selectItemName: 'tradingpair',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isInProgress,
        opacity: 0,
        progressIndicator: CupertinoActivityIndicator(
          radius: 12,
        ),
        child: Column(
          children: <Widget>[
            // !widget.isWithoutAppBar
            //     ? SizedBox(
            //         height: appBarheight,
            //       )
            //     : Container(),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 10
              ),
              child: Row(
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
                      'assets/fedriclogo.png',fit: BoxFit.cover,
                      height: 50 ,
                      width: 50,
                    ),
                  ),                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15 , left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Balance',
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: ConstanceData.SIZE_TITLE25,
                    ),
                  ),
                  Text(
                    "\$0",
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: EdgeInsets.only(left: 10),
              //color: Colors.white,
              height: MediaQuery.of(context).size.height/1.15,
              width: MediaQuery.of(context).size.width/1.07,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.05,
                      child: Material(
                        color: Colors.white,
                        child: TabBar(
                          indicatorColor: darkblue,
                          unselectedLabelColor: Colors.black,
                          labelColor: darkblue,

                          tabs: [
                            Tab(child: Text('Crypto',),),
                            Tab(child: Text('Fiat'),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                              color: Colors.white,
                              child: WithdrawCoin()),

                          Container(
                              color: Colors.white,
                              child: WithDrawFiat()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
