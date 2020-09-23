import 'month.dart';

class CalendarBuilder {

  static const int DECEMBER = 12;
  static const int JANUARY = 1;

  DateTime creationDate;
  int calendarSize;
  List<Month> months;

  CalendarBuilder(){
    creationDate = DateTime.now();
    months = new List<Month>();
    calendarSize = 13;
    makeCalendarModel();
  }

  makeCalendarModel(){
    addPreviousMonthToCalendar();
    addCurrentAndFutureMonths();
  }

  addPreviousMonthToCalendar(){
    if(creationDate.month == JANUARY) {
      months.add(Month(creationDate.year - 1, 12));
    }else{
      months.add(Month(creationDate.year, creationDate.month - 1));
    }
  }

  addCurrentAndFutureMonths(){
    for(int i = 0; i < calendarSize; i++){
      int currentMonth = creationDate.month+i;
      addMonthToCalendar(currentMonth);
    }
  }

  addMonthToCalendar(int monthNumber){
    if(monthNumber > DECEMBER){
      startANewYear(monthNumber);
    }else {
      months.add(Month(creationDate.year, monthNumber));
    }
  }

  startANewYear(int month){
    months.add(Month(creationDate.year+1, month-DECEMBER));
  }

  getMonths() => months;
}