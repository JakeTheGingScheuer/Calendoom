import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/day_transaction.dart';

import 'date.dart';

class Day extends ChangeNotifier {

  Date date;
  List<Transaction> transactions;
  double credits = 0.00;
  double debits = 0.00;
  double balance = 0.00;

  Day(this.date) {
    this.transactions = List<Transaction>();
  }

  calculateBalance() {
    this.credits = 0.00;
    this.debits = 0.00;

    transactions.forEach((trans) => addToLedger(trans));

    balance = credits + debits;
  }

  addToLedger(Transaction transaction){
    if(transaction.isCredit){
      credits += transaction.value;
    } else {
      debits += transaction.value;
    }
  }

  addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }

  String dayKey(){
    return date.getTitle();
  }

  Map<String,dynamic> toJson() {
    Map<String, dynamic> dayJson = new Map();
    dayJson['date'] = date.toJson();

    Map<String, dynamic> transactionMap = new Map();
    for(int i = 0; i<transactions.length; i++){
      transactions[i].setTransKey(i);
      transactionMap[transactions[i].transKey] = transactions[i].toJson();
    }
    dayJson['transactions'] = transactionMap;

    return dayJson;
  }

  Day.fromJson(Map<String,dynamic> json){
    date = Date.fromJson(json['date']);
    transactions = List<Transaction>();

    Map<String, dynamic> transactionsJson = json['transactions'];

    for(int i = 0; i < transactionsJson.length; i++){
      String transactionKey = i.toString();
      transactions.add(Transaction.fromJson(transactionsJson[transactionKey]));
    }
  }
}