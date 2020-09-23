import 'package:flutter/material.dart';
import 'package:test_driving/models/appState.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/widgets/calendar/day_tile_builder.dart';

class MonthTile extends StatelessWidget {

  AppState calendar;
  int index;
  MonthTile(this.calendar, this.index);

  @override
  Widget build(BuildContext context) {
    Month month = calendar.calendar[index];

    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        children: <Widget>[
          monthTitle(month),
          SizedBox(height: 15),
          monthGridOfDays(month)
        ],
      ),
    );
  }

  Container monthTitle(Month month){
    return Container(
        width: 400,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              monthYearFormat(month),
            ]
        )
    );
  }

  Text monthYearFormat(Month month) {
    return Text(
        month.monthName + ' ' + month.year.toString(), key: Key('monthTitle'),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green)
    );
  }

  Container monthGridOfDays(Month month){
    DayTileListBuilder buildList = DayTileListBuilder(month);
    return Container(
      height: 300,
      child: GridView.count(
          key: Key('monthView'),
          crossAxisCount: 7,
          children: buildList.dayTilesForThisMonth
      ),
    );
  }
}