import 'package:test_api/test_api.dart';
import 'package:test_driving/models/dataStore.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/models/day_transaction.dart';

void main() {
  group('unit tests for calendar', () {
    test('Calendar should have a list of 14 months', () {
      DataStore testCalendar = DataStore();

      expect(testCalendar.calendar.length, 14);
    });

    test('to Json makes a map of months', (){
      DataStore testCalendar = DataStore();
      Map<String, dynamic> calendarJson = testCalendar.toJson();

      expect(calendarJson['months'].length, 14);
    });

    test('from Json makes creates a calendar', (){
      DataStore fakeCalendar = DataStore();
      Map<String, dynamic> calendarJson = fakeCalendar.toJson();

      DataStore calendarFromJson = DataStore.fromJson(calendarJson);

      expect(calendarFromJson.calendar.length, 14);
    });

    test('data persists through layers', () {
      DataStore fakeCalendar = DataStore();
      Month fakeMonth = fakeCalendar.calendar[1];
      Day fakeDay = fakeMonth.days[1];
      Transaction fakeTrans = Transaction(fakeDay.date);

      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      fakeDay.addTransaction(fakeTrans);

      Map<String, dynamic> calendarJson = fakeCalendar.toJson();
      DataStore calendarFromJson = DataStore.fromJson(calendarJson);

      Month monthPersisted = calendarFromJson.calendar[1];
      Day dayPersisted = monthPersisted.days[1];

      expect(dayPersisted.balance, 20.00);
    });

  });
}