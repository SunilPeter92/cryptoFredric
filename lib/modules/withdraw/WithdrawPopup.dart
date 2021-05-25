import 'package:flutter/material.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import '../../constance/themes.dart';
import '../../constance/constance.dart';

class WithDrawPopup extends StatefulWidget {
  @override
  _WithDrawPopupState createState() => _WithDrawPopupState();
}

class _WithDrawPopupState extends State<WithDrawPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10 , left: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Row(
            children: [
              Text('Daily WithDraw Limits:', style: TextStyle(fontSize: 12),),
              Text('0.000000000/2BTC', style: TextStyle(fontSize: 12),),
            ],
          ),
          Spacer(),
          Container(
            height: 47,
            width: 150,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
              color: lightblue,
              border:
              Border.all(color: Colors.white, width: 1.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Withdraw Payment",
              style: TextStyle(
                  color: AllCoustomTheme
                      .getReBlackAndWhiteThemeColors(),
                  letterSpacing: 0.3,
                  fontSize: ConstanceData.SIZE_TITLE16),
            ),
          ),
        ],
      ),
    );
  }

  bool _lights = true;
  bool endOfDay = false;
}
