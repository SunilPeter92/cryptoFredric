import 'dart:io';

import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/modules/CardValidation/Input_formatters.dart';
import 'package:CanuckCrypto/modules/CardValidation/my_strings.dart';
import 'package:CanuckCrypto/modules/CardValidation/payment_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class PayAmount extends StatefulWidget {
  @override
  _PayAmountState createState() => _PayAmountState();
}

class _PayAmountState extends State<PayAmount> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidate = false;
  var _card = new PaymentCard();

  List<String> _countries = ['United Kingdom', 'Pakistan', 'Dubai'];

  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: lightblue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "PAY WITH CARD",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // height: MediaQuery.of(context).size.height,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                color: lightblue,
                height: 50,
              ),
              Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Container(
                  decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.vertical(
                      //       top: Radius.circular(50),
                      //     ),
                      //   ),
                      // ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0, left: 15),
                                child: Text(
                                  "Email",
                                  style: TextStyle(fontSize: 16, color: lightblue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0, left: 15, right: 15, top: 5),
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(10.0),
                                    border: Border.all(color: lightblue),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 13),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "testing@gmail.com",
                                      contentPadding: EdgeInsets.only(left: 10)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 15),
                              child: Text(
                                "CardInformation",
                                style: TextStyle(fontSize: 18, color: lightblue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 5.0, left: 15, right: 15, top: 5),
                              child: Container(
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   border: Border.all(color: lightblue),
                                //   borderRadius: new BorderRadius.circular(10.0),
                                // ),
                                child: TextFormField(
                                  validator: CardUtils.validateCardNum,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    new LengthLimitingTextInputFormatter(19),
                                    new CardNumberInputFormatter()
                                  ],
                                  style: TextStyle(fontSize: 13),
                                  controller: numberController,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: lightblue)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: lightblue)),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: lightblue)),
                                    filled: true,
                                    hintText: "1234 1234 1234 1234",


                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: _suffixIcon(),
                                    ),
                                    // labelText: 'Number',
                                  ),
                                  onSaved: (String value) {
                                    print('onSaved = $value');
                                    print('Num controller has = ${numberController.text}');
                                    _paymentCard.number = CardUtils.getCleanedNumber(value);
                                  },
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15.0,
                                    left: 15,
                                  ),
                                  child: Container(

                                    width:
                                    MediaQuery.of(context).size.width * 0.4,

                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 1,
                                      ),
                                      child: TextFormField(
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter.digitsOnly,
                                          new LengthLimitingTextInputFormatter(4),
                                          new CardMonthInputFormatter()
                                        ],
                                        style: TextStyle(fontSize: 13),
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: lightblue)),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: lightblue)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: lightblue)),
                                          filled: true,
                                          // icon: new Image.asset(
                                          //   'assets/images/calender.png',
                                          //   width: 40.0,
                                          //   color: Colors.grey[600],
                                          // ),
                                          hintText: 'MM/YY',

                                          //  labelText: 'Expiry Date',
                                        ),
                                        validator: CardUtils.validateDate,
                                        keyboardType: TextInputType.number,
                                        onSaved: (value) {
                                          List<int> expiryDate = CardUtils.getExpiryDate(value);
                                          _paymentCard.month = expiryDate[0];
                                          _paymentCard.year = expiryDate[1];
                                        },

                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15.0,
                                    left: 5,
                                    right: 15,
                                  ),
                                  child: Container(

                                    width:
                                    MediaQuery.of(context).size.width * 0.5,

                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 1,
                                      ),
                                      child: TextFormField(
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter.digitsOnly,
                                          new LengthLimitingTextInputFormatter(4),
                                        ],
                                        style: TextStyle(fontSize: 13),
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: lightblue)),
                                          enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: lightblue)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: lightblue)),
                                          filled: true,
                                          // icon: new Image.asset(
                                          //   'assets/images/card_cvv.png',
                                          //   width: 40.0,
                                          //   color: Colors.grey[600],
                                          // ),
                                          suffixIcon:
                                          Icon(FontAwesomeIcons.ccMastercard),
                                          hintText: "CVC",

                                          //  labelText: 'CVV',
                                        ),
                                        validator: CardUtils.validateCVV,
                                        keyboardType: TextInputType.number,
                                        onSaved: (value) {
                                          _paymentCard.cvv = int.parse(value);
                                        },

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 15),
                                child: Text(
                                  "  Name On Card",
                                  style: TextStyle(fontSize: 18, color: lightblue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0, left: 15, right: 15, top: 5),
                                child: Container(

                                  child: TextFormField(
                                    onSaved: (String value) {
                                      _card.name = value;
                                    },
                                    style: TextStyle(fontSize: 13),
                                    keyboardType: TextInputType.text,
                                    validator: (String value) =>
                                    value.isEmpty ? Strings.fieldReq : null,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,

                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: lightblue)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: lightblue)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: lightblue)),
                                      hintText: "Lord Neilson",

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                        onTap: (){  _validateInputs();},
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
                                "Save",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      _showInSnackBar('Payment card is valid');
    }
  }

  void _showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }
  Widget _suffixIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [

        Icon(
          FontAwesomeIcons.ccVisa,
        ),
      ],
    );
  }
}
