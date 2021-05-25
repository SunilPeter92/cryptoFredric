import 'package:CanuckCrypto/modules/buysell/BuyCoin.dart';
import 'package:flutter/material.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import '../../constance/themes.dart';
import '../../constance/constance.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyPopup extends StatefulWidget {
  @override
  _BuyPopupState createState() => _BuyPopupState();
}

class _BuyPopupState extends State<BuyPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10 , left: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Center(child: Text('Confirm Order', style: TextStyle(fontSize: 15),)),
          SizedBox(height: 10,),
          Text('You will receive', style: TextStyle(fontSize: 10),),
          SizedBox(height: 10,),
          Text('0..005 BTC', style: TextStyle(fontSize: 18),),
          SizedBox(height: 20,),
          Container(

            height: 90,
            padding: EdgeInsets.only(left: 10 , right: 10 ,top:10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pay with', style: TextStyle(fontSize: 13 , color: black),),
                    Icon(  FontAwesomeIcons.ccMastercard , size: 20, )
                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price', style: TextStyle(fontSize: 13 , color: black),),
                    Text('1 BTC+ 50,830.4498 usd', style: TextStyle(fontSize: 13 , color: black),),

                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fee(2.06%)', style: TextStyle(fontSize: 13 , color: black),),
                    Text('0.31 usd', style: TextStyle(fontSize: 13 , color: black),),

                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total spent', style: TextStyle(fontSize: 13 , color: black),),
                    Text('15 usd', style: TextStyle(fontSize: 13 , color: black),),

                  ],
                ),
              ]
            ),
          ),
          SizedBox(height: 20,),
          Text('please review your order carefully as payment cannot be canceled, recalled, or refunded.',textAlign: TextAlign.center, style: TextStyle(fontSize: 13),),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BuyCoin()),);
            },
            child: Container(
              height: 47,
              width: 200,
              alignment: FractionalOffset.center,
              decoration: BoxDecoration(
                color: white,
                border:
                Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Confirm (50s)",
                style: TextStyle(
                    color: black ,
                    letterSpacing: 0.3,
                    fontSize: ConstanceData.SIZE_TITLE16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _lights = true;
  bool endOfDay = false;
}
