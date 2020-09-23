import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/account_transaction.dart';

class CreditCardAccount extends ChangeNotifier{
  double creditLineAmount;
  double availableBalance;
  String accountName;

  CreditCardAccount(double creditLineAmount, String name){
    this.creditLineAmount = creditLineAmount;
    this.availableBalance = creditLineAmount;
    this.accountName = name;
  }

  void addTransaction(AccountTransaction trans){
    if(trans.isPayment){
      availableBalance += trans.amount;
    } else availableBalance -= trans.amount;
    notifyListeners();
  }

  void setCreditLineAmount(double amount){
    this.creditLineAmount = amount;
    this.availableBalance = amount;
  }

  void setAccountName(String name){
    this.accountName = name;
    notifyListeners();
  }

  double getAvailableBalance(){
    return this.availableBalance;
  }
  double getCreditLineAmount(){
    return this.creditLineAmount;
  }

  String accountKey(){
    return this.accountName;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map['creditLineAmount'] = creditLineAmount;
    map['availableBalance'] = availableBalance;
    map['accountName'] = accountName;

    return map;
  }

  CreditCardAccount.fromJson(Map<String, dynamic> json){
    creditLineAmount = json['creditLineAmount'];
    availableBalance = json['availableBalance'];
    accountName = json['accountName'];
  }
}