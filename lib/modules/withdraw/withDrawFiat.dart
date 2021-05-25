import 'package:CanuckCrypto/List/FiatList.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/modules/deposite/depositeCurrency.dart';
import 'package:CanuckCrypto/modules/withdraw/WithDraw.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawCurrency.dart';
import 'package:flutter/material.dart';

class WithDrawFiat extends StatefulWidget {
  @override
  _WithDrawFiatState createState() => _WithDrawFiatState();
}

class _WithDrawFiatState extends State<WithDrawFiat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(

        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left:0),
                height: MediaQuery.of(context).size.height/1.27 ,
                child: ListView.builder(
                    itemCount:fiatList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DepositeCurrency()),
                          );
                        },
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    // color: black,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Image.asset(fiatList[index].image ,fit: BoxFit.fill,)),
                              SizedBox(width: 30,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(fiatList[index].name , maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: black , ),),
                                  Text(fiatList[index].Countryname , maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey ,fontSize: 11 ),),
                                ],
                              ),
                              Spacer(),
                              Text(fiatList[index].Status , maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey ,fontSize: 12  ),),
                            ],
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
