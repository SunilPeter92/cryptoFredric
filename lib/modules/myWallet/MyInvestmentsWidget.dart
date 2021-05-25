import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:animator/src/animator.dart';
import '../../constance/global.dart' as globals;
import 'package:cached_network_image/cached_network_image.dart';

class MyInvestmentsWidget extends StatelessWidget {
  String coinName;
  String price;
  String coinAmount;
  MyInvestmentsWidget({
    @required this.coinName,
    @required this.price,
    @required this.coinAmount,
  });
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              darkblue,
              lightblue,
            ],
          )
      ),
      width: 230,
      child: Column(
        children: <Widget>[
          Container(
            height: 2,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(2)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 12, left: 12),
            child: Row(
              children: <Widget>[
                Text(
                  'BTCCoin',
                  style: TextStyle(
                    color: AllCoustomTheme
                        .getTextThemeColors(
                        isContrast: true),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(
                left: 12, right: 12, top: 10),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '\$',
                      style: TextStyle(
                        color: AllCoustomTheme
                            .getTextThemeColors(
                            isContrast: true),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1534',
                      style: TextStyle(
                        color: AllCoustomTheme
                            .getTextThemeColors(
                            isContrast: true),
                        fontWeight: FontWeight.bold,
                        fontSize: ConstanceData
                            .SIZE_TITLE25,
                      ),
                    ),
                    Text(
                      '.56',
                      style: TextStyle(
                        color: AllCoustomTheme
                            .getTextThemeColors(
                            isContrast: true),
                        fontWeight: FontWeight.bold,
                        fontSize: ConstanceData
                            .SIZE_TITLE20,
                      ),
                    ),
                    // SizedBox(height:10)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '0.023452',
                      style: TextStyle(
                          color: AllCoustomTheme
                              .getTextThemeColors(
                              isContrast:
                              true)
                              .withOpacity(0.6)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
