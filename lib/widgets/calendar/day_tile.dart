import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/pages/day_screen.dart';

class DayTile extends BlankTile {

  Day day;
  double runningBalance;
  DayTile(this.day, this.runningBalance);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute( builder: (context) => DayScreen(day)));},
        child: GridTile(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: ifToday()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(color: Colors.blue[300]),
                        child: Text(day.date.dayNumber.toString(), style: TextStyle(fontWeight: FontWeight.w500),)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          child: Text(
                            '\$'+runningBalance.toStringAsFixed(0),
                            style: TextStyle(fontSize: 10, color: Colors.greenAccent),
                      ))),
                    dailyDiff()
                  ],
                )
            )));
  }

  Container dailyDiff(){
    if(day.balance>0){
      return Container(
        alignment: Alignment.center,
        child: Icon(
          CupertinoIcons.up_arrow, color: Colors.green[500], size: 16,
        ));
    }
    if(day.balance<0){
      return Container(
       child: Icon(
       CupertinoIcons.down_arrow, color: Colors.red, size: 16,
      ));
    }
    return Container();
  }

  Color ifToday(){
    DateTime today = DateTime.now();
    DateUtil util = DateUtil();
    String monthToday = util.month(today.month);
    if((day.date.dayNumber == today.day)&&(monthToday == day.date.monthName) &&(day.date.year == today.year)){
      return Colors.blue[900];
    } return Colors.black;
  }
}

class BlankTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: GridTile(child: Text('')));
  }
}