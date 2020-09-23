import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/models/day_transaction.dart';

void main() {
  group('unit tests for month', () {

    test('the month of july should have 31 days', () {
      Month testMonth = Month(2019, 7);
      expect(testMonth.days.length, 31);
    });

    test('month 1 should be January', () {
      Month testMonth = Month(2019, 1);
      expect(testMonth.monthName, 'January');
    });

    test('month 1 in 2019 should be January 2019', () {
      Month testMonth = Month(2019, 1);
      expect(testMonth.monthName, 'January');
      expect(testMonth.year, 2019);
    });

    test('month should produce a list of days on creation that is appropriate', () {
      Month testMonth = Month(2019, 1);
      expect(testMonth.days.length, 31);
    });

    test('toJson creates a map with month name, year, and days', () {
      Month testMonth = Month(2019, 1);

      Map<String, dynamic> monthJson = testMonth.toJson();

      expect(monthJson['monthName'], 'January');
      expect(monthJson['year'], 2019);
      expect(monthJson['days'].length, 31);
    });

    test('from Json', (){
      Month fakeMonth = Month(2019, 1);

      Map<String, dynamic> monthJson = fakeMonth.toJson();
      Month testMonthFromJson = Month.fromJson(monthJson);

      expect(testMonthFromJson.monthName, 'January');
      expect(testMonthFromJson.year, 2019);
      expect(testMonthFromJson.days.length, 31);
    });

    test('data persists across layers', (){
      Month fakeMonth = Month(2019, 1);
      Day fakeDay = fakeMonth.days[1];

      Transaction fakeTrans = Transaction(fakeDay.date);
      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      fakeDay.addTransaction(fakeTrans);

      Map<String, dynamic> monthJson = fakeMonth.toJson();
      Month testMonthFromJson = Month.fromJson(monthJson);

      Day dayPersisted = testMonthFromJson.days[1];
      dayPersisted.calculateBalance();

      expect(dayPersisted.balance, 20.00);
    });
  });
}