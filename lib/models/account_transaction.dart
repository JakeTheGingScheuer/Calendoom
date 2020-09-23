import 'package:flutter/material.dart';

class AccountTransaction extends ChangeNotifier{
  double amount;
  bool isPayment;

  AccountTransaction(this.amount, this.isPayment);

  void setAmount(double amount){
    this.amount = amount;
    notifyListeners();
  }

  void setIsPayment(bool input){
    this.isPayment = input;
    notifyListeners();
  }
}