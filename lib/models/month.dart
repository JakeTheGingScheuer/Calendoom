import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/time.dart';
import 'date.dart';
import 'day.dart';

class Month extends ChangeNotifier{
  String monthName;
  int monthNumber;
  int year;
  List<Day> days;

  DateUtil dateUtil = DateUtil();
  double endOfMonthBalance = 0.00;
  double beginningMonthBalance = 0.00;

  Month(int year, int monthNumber) {
    this.days = new List<Day>();
    this.year = year;
    this.monthName = dateUtil.month(monthNumber);
    this.monthNumber = monthNumber;
    DateTime firstDayOfTheMonth = DateTime(year, monthNumber);

    for(int i = 0; i< daysInMonth(year, monthNumber); i++){
      DateTime dateTime = firstDayOfTheMonth.add(new Duration(days: i));
      Date nextDaysDate = Date(dateTime);
      days.add(Day(nextDaysDate));
    }
  }

  setBeginningBalance(double value) {
    this.beginningMonthBalance = value;
  }

  double getRunningBalance(int dayNumber){
    double balance = beginningMonthBalance;
    for(int i = 0; i < dayNumber; i++){
      balance += days[i].balance;
    }
    return balance;
  }

  setEndOfMonthBalance(){
    double balance = beginningMonthBalance;
    days.forEach((day)=> balance += day.balance);
    this.endOfMonthBalance = balance;
  }

  String monthKey(){
    return monthName+' '+year.toString();
  }






  Map<String,dynamic> toJson() {

    Map<String, dynamic> monthJson = new Map();
    Map<String, dynamic> daysMap = new Map();
    monthJson['monthName'] = monthName;
    monthJson['year'] = year;
    monthJson['monthNumber'] = monthNumber;

    days.forEach((day)=> daysMap[day.dayKey()] = day.toJson());

    monthJson['days'] = daysMap;

    return monthJson;
  }

  Month.fromJson(Map<String, dynamic> json){
    days = new List<Day>();
    monthName = json['monthName'];
    year = json['year'];
    monthNumber = json['monthNumber'];

    Map<String, dynamic> daysJson = json['days'];

    daysJson.values.forEach((day) => days.add(Day.fromJson(day)));

    getRunningBalance(days.length);
  }
}