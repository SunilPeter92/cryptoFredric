import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/modules/PayCard/PaywithCard.dart';
import 'package:CanuckCrypto/modules/buysell/BuyCoin.dart';
import 'package:flutter/material.dart';

class Buy_Coin extends StatefulWidget {
  @override
  _Buy_CoinState createState() => _Buy_CoinState();
}

class _Buy_CoinState extends State<Buy_Coin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          darkblue,
                          lightblue,
                        ],
                      )
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(left: 10 , right: 10,top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back_ios_rounded),
                        SizedBox(height: 40,),
                        Text('Buy USDT' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600 ,),),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text('Price :' , style: TextStyle(color: black),),
                            SizedBox(width: 5,),
                            Text('484.61 USDT' , style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Limit :' , style: TextStyle(color: black),),
                            SizedBox(width: 5,),
                            Text('1444.46 - ' , style: TextStyle(color:Colors.white),),
                            Text('5999.19 USDT ' , style: TextStyle(color:Colors.white),),
                          ],
                        ),

                      ],
                    ),
                  ) ,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 230),
                  child: Center(
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width/1.2,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10 , right: 10 , top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( 'Total Amount' , style: TextStyle(color: black),),
                            SizedBox(height: 20,),
                            TextFormField(
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(

                                  borderRadius: const BorderRadius.all(

                                    const Radius.circular(8.0),
                                  ),
                                  borderSide: new BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter Amount',
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),


                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text('Quantity' , style: TextStyle(color: Colors.grey , fontSize: 13),),
                                Spacer(),
                                Text('1500.00 USDT' , style: TextStyle(color: black , fontSize: 15)),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text('Amount' , style: TextStyle(color: Colors.grey , fontSize: 13),),
                                Spacer(),
                                Text('726,915 NGN' , style: TextStyle(color: black , fontSize: 15),),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Text( 'Fill Card Details' , style: TextStyle(color: black , fontSize: 15),),
                            //     Spacer(),
                            //     Text('4242 4242 **** ****', style: TextStyle(color: Colors.grey , fontSize: 13),),
                            //     InkWell(
                            //         onTap: (){
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(builder: (context) => PayAmount()),
                            //           );
                            //         },
                            //         child: Icon(Icons.arrow_forward_ios_rounded , size: 15,))
                            //   ],
                            // ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BuyCoin()),);
                              },
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent[400],
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      "Buy USDT",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,)


                          ],
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: Text('Trade Info' , style: TextStyle(color: black , fontSize: 18 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: Row(
                children: [
                  Text("Buyer's Nickname" , style: TextStyle(color: black, fontSize: 13),),
                  Spacer(),
                  Text('Mr Big' , style: TextStyle(color: black , fontSize: 15),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: Row(
                children: [
                  Text("Payment Window" , style: TextStyle(color: black, fontSize: 13),),
                  Spacer(),
                  Text(' 15 min' , style: TextStyle(color: black , fontSize: 15 , fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: Text('Payment Method' , style: TextStyle(color: black , fontSize: 18 , fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20 , right: 20),
              child: Text('Pay with Card' , style: TextStyle(color: black , fontSize: 15 ),),
            ),
          ],
        ),
      ) ,
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("CanuckCrypto" , style: TextStyle(color: darkblue),),
      content: Text("Thankyou" , style: TextStyle(color: lightblue),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
