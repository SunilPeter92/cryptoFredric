import 'package:CanuckCrypto/Global/Global.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyModel with ChangeNotifier { //                          <--- MyModel
  String someValue = '20';

  void doSomething(double price) {
    print(price);
    someValue = price.toString();
    Global.currencyname=  price.toString();
    print(someValue);
    notifyListeners();

  }
}