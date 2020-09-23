import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/account.dart';
import 'package:test_driving/models/balance_calculator.dart';
import 'package:test_driving/models/calendar_builder.dart';
import 'month.dart';

class AppState extends ChangeNotifier {
  List<Month> calendar;
  List<CreditCardAccount> accounts;
  BalanceCalculator balanceData;

  AppState() {
    CalendarBuilder builder = new CalendarBuilder();
    calendar = builder.getMonths();
    accounts = new List<CreditCardAccount>();
    update();
  }

  update(){
    balanceData = BalanceCalculator(calendar);
  }

  Map<String,dynamic> toJson() {

    Map<String, dynamic> dataStoreJson = new Map();
    Map<String, dynamic> calendarMap = new Map();
    Map<String, dynamic> accountsMap = new Map();

    calendar.forEach((month) => calendarMap[month.monthKey()] = month.toJson());
    accounts.forEach((account) => accountsMap[account.accountKey()] = account.toJson());

    dataStoreJson['calendar'] = calendarMap;
    dataStoreJson['accounts'] = accountsMap;

    return dataStoreJson;
  }

  AppState.fromJson(Map<String, dynamic> json){
    accounts = getAccounts(json);
    calendar = new List<Month>();
    DateTime creationDate = DateTime.now();
    Map<String, dynamic> calendarJson = json['calendar'];
    List<String> monthKeys = calendarJson.keys.toList();
    int totalMonthsSaved = calendarJson.length;

    bool upToDate = false;

    for (int i = 0; i < totalMonthsSaved; i++) {
      Month monthOnFile = Month.fromJson(calendarJson[monthKeys[i]]);

      bool monthOnFileIsLastMonth = creationDate.month-1 == monthOnFile.monthNumber;

      if(!upToDate && monthOnFileIsLastMonth) {
        upToDate = true;
      }

      if (upToDate) {
        calendar.add(monthOnFile);
      }
    }

    if(calendar.length < totalMonthsSaved){
      DateTime endingDate = creationDate.add(Duration(days: 365));
      calendar.add(Month(endingDate.year, endingDate.month));
    }
    update();
  }

  List<CreditCardAccount> getAccounts(Map<String, dynamic> json){

    List<CreditCardAccount> accounts = new List<CreditCardAccount>();
    Map<String, dynamic> accountsJson = json['accounts'];
    List<String> accountKeys = accountsJson.keys.toList();
    int totalAccountsSaved = accountsJson.length;

    for(int i = 0; i < totalAccountsSaved; i++){
      CreditCardAccount accountOnFile = CreditCardAccount.fromJson(accountsJson[accountKeys[i]]);
      accounts.add(accountOnFile);
    }
    return accounts;
  }
}