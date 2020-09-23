import 'package:test_api/test_api.dart';
import 'package:test_driving/models/appState.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/models/day_transaction.dart';

void main() {
  group('unit tests for calendar', () {
    test('Calendar should have a list of 14 months', () {
      AppState testCalendar = AppState();

      expect(testCalendar.calendar.length, 14);
    });

    test('to Json makes a map of months', (){
      AppState testCalendar = AppState();
      Map<String, dynamic> calendarJson = testCalendar.toJson();

      expect(calendarJson['months'].length, 14);
    });

    test('from Json makes creates a calendar', (){
      AppState fakeCalendar = AppState();
      Map<String, dynamic> calendarJson = fakeCalendar.toJson();

      AppState calendarFromJson = AppState.fromJson(calendarJson);

      expect(calendarFromJson.calendar.length, 14);
    });

    test('data persists through layers', () {
      AppState fakeCalendar = AppState();
      Month fakeMonth = fakeCalendar.calendar[1];
      Day fakeDay = fakeMonth.days[1];
      Transaction fakeTrans = Transaction(fakeDay.date);

      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      fakeDay.addTransaction(fakeTrans);

      Map<String, dynamic> calendarJson = fakeCalendar.toJson();
      AppState calendarFromJson = AppState.fromJson(calendarJson);

      Month monthPersisted = calendarFromJson.calendar[1];
      Day dayPersisted = monthPersisted.days[1];

      expect(dayPersisted.balance, 20.00);
    });

  });
}