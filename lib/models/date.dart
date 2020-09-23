import 'package:date_util/date_util.dart';

class Date {
  DateUtil dateUtil = DateUtil();
  static const OFFSET = 2;

  int monthNumber;
  int dayNumber;
  int year;
  int weekdayNumber;
  String weekday;
  String monthName;

  Date(DateTime dateTime){
    DateUtil dateUtil = DateUtil();
    this.monthNumber = dateTime.month;
    this.dayNumber = dateTime.day;
    this.year = dateTime.year;
    this.weekdayNumber = dateTime.weekday;
    this.weekday = dateUtil.day(this.weekdayNumber+OFFSET);
    this.monthName = dateUtil.month(this.monthNumber);
  }

  getTitle() {
    return weekday+' '+monthName+' '+dayNumber.toString()+', '+year.toString();
  }

  toJson() {
    Map<String, dynamic> map = new Map();
    map['monthNumber'] = this.monthNumber;
    map['dayNumber'] = this.dayNumber;
    map['year'] = this.year;
    map['weekdayNumber'] = this.weekdayNumber;
    map['weekday'] = this.weekday;
    map['monthName'] = this.monthName;

    return map;
  }

  Date.fromJson(Map<String, dynamic> json) {
    monthNumber = json['monthNumber'];
    dayNumber = json['dayNumber'];
    year = json['year'];
    weekdayNumber = json['weekdayNumber'];
    weekday = json['weekday'];
    monthName = json['monthName'];
  }
}