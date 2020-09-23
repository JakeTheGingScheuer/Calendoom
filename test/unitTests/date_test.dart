import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/date.dart';

void main() {

  DateTime dateTime = new DateTime(2019, 8, 13);
  Date date = new Date(dateTime);

  group('unit tests for date', () {
    test('Date initialization', () {
      expect(date.monthNumber, 8);
      expect(date.dayNumber, 13);
      expect(date.year, 2019);
    });

    test('Date finds and stores its weekday number and string interpretation of it', () {
      expect(date.weekdayNumber, 2);
      expect(date.weekday, 'Tuesday');
    });

    test('Date makes a String interpretation of the month', () {
      expect(date.monthName, 'August');
    });

    test('Get title returns a string of the full date', () {
      expect(date.getTitle(), 'Tuesday August 13, 2019');
    });

    test('Data persists appropriatley', () {
      Map<String, dynamic> json = date.toJson();
      Date fromJson = Date.fromJson(json);
      expect(fromJson.getTitle(), date.getTitle());
    });
  });
}