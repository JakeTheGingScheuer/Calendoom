import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/appState.dart';
import 'package:test_driving/widgets/calendar/month_tile.dart';

class CalendarView extends StatelessWidget {

  AppState calendar;
  CalendarView(this.calendar);
  List<MonthTile> monthViews;

  @override
  Widget build(BuildContext context) {
    monthViews = monthViewBuilder(calendar);

    return Container(
        key: Key('CalendarView'),
        height: 400,
        width: 400,
        child: PageView (
            controller: PageController(
                initialPage: 1
            ),
            children: monthViews
        )
    );
  }

  List<MonthTile> monthViewBuilder(AppState calendar){
    List<MonthTile> monthViews = new List<MonthTile>();
    for(int i = 0; i < 13; i++){
      monthViews.add(MonthTile(calendar, i));
    }return monthViews;
  }
}
