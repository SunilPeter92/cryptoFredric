import 'dart:math';

import 'package:CanuckCrypto/constance/constance.dart';
import 'package:CanuckCrypto/constance/global.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:animator/src/animator.dart';
import '../../constance/global.dart' as globals;
import 'package:cached_network_image/cached_network_image.dart';

class RecentTransactionsTile extends StatelessWidget {
  String title;
  String type;
  String amount;
  RecentTransactionsTile({
    @required this.title,
    @required this.type,
    @required this.amount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Apple Music',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(
                            isContrast: true),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'SUBSCRIPTION',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(
                            isContrast: true),
                        fontSize: ConstanceData.SIZE_TITLE12,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child:Text(
                    "-\$10",
                    style: TextStyle(
                      color: AllCoustomTheme.getTextThemeColors(
                          isContrast: true),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.white,indent: 10, endIndent: 15,),
          ],
        ),
      ),
    );
  }
}
