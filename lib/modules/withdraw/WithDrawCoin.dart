import 'package:CanuckCrypto/List/portfolioList.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/themes.dart';
import 'package:CanuckCrypto/modules/deposite/depositeCurrency.dart';
import 'package:CanuckCrypto/modules/withdraw/WithDraw.dart';
import 'package:CanuckCrypto/modules/withdraw/withdrawCurrency.dart';
import 'package:flutter/material.dart';

class WithdrawCoin extends StatefulWidget {
  @override
  _WithdrawCoinState createState() => _WithdrawCoinState();
}

class _WithdrawCoinState extends State<WithdrawCoin> {
  @override
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(

        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: MediaQuery.of(context).size.height/1.27 ,
                child: ListView.builder(
                    itemCount:portfolioList.length,
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
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    // color: black,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Image.asset(portfolioList[index].image ,fit: BoxFit.fill,)),
                              SizedBox(width: 30,),
                              Text(portfolioList[index].name , maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: black , ),),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Text('\$' + portfolioList[index].price1.toString()   , style: TextStyle(color: black ,fontSize: 18 , fontWeight: FontWeight.w600 ))),
                                  Container(child: Text(portfolioList[index].price2.toString() , style: TextStyle(color: Colors.grey , ))),

                                ],
                              ),
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


