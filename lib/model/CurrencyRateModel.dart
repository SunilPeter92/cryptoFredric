class CurrencyRateModel {
  String date;
  String base;
  Rates rates;

  CurrencyRateModel({this.date, this.base, this.rates});

  CurrencyRateModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    base = json['base'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['base'] = this.base;
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    return data;
  }
}

class Rates {
  String pKR;
  String gBP;
  String eUR;
  String uSD;

  Rates({this.pKR, this.gBP, this.eUR, this.uSD});

  Rates.fromJson(Map<String, dynamic> json) {
    pKR = json['PKR'];
    gBP = json['GBP'];
    eUR = json['EUR'];
    uSD = json['USD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PKR'] = this.pKR;
    data['GBP'] = this.gBP;
    data['EUR'] = this.eUR;
    data['USD'] = this.uSD;
    return data;
  }
}