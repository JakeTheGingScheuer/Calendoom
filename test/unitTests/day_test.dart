import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/date.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/day_transaction.dart';

void main() {
  DateTime mockDateTime = DateTime(2000,1,1);
  Date mockDate = Date(mockDateTime);

  group('unit tests for day', () {
    test('Day init test', () {
      Day testDay = Day(mockDate);
      expect(testDay.date.getTitle(), mockDate.getTitle());
      expect(testDay.credits, 0.00);
      expect(testDay.debits, 0.00);
      expect(testDay.balance, 0.00);
      expect(testDay.transactions, []);
    });

    test('Day should be able to add a new tranaction', () {
      Day testDay = Day(mockDate);
      testDay.addTransaction(Transaction(mockDate));
      expect(testDay.transactions.length, 1);
    });

    test('Day should be able to delete a transaction', () {
      Day testDay = Day(mockDate);
      Transaction mockTrans = Transaction(mockDate);
      testDay.addTransaction(mockTrans);
      testDay.deleteTransaction(mockTrans);
      expect(testDay.transactions.length, 0);
    });

    test('Day should have a balance that reflects the amount of all transactions', () {
      Day testDay = Day(mockDate);
      Transaction mockTrans1 = Transaction(mockDate);
      Transaction mockTrans2 = Transaction(mockDate);
      mockTrans1.setAmount(5.00);
      mockTrans2.setAmount(3.00);

      testDay.addTransaction(mockTrans1);
      testDay.addTransaction(mockTrans2);
      testDay.calculateBalance();
      expect(testDay.balance, -8.00);
    });

    test('Day should return total of all credits when get credits is called', () {
      Day testDay = Day(mockDate);
      Transaction mockTrans1 = Transaction(mockDate);
      Transaction mockTrans2 = Transaction(mockDate);
      mockTrans1.setIsCredit(true);
      mockTrans1.setAmount(5.00);
      mockTrans2.setAmount(3.00);

      testDay.addTransaction(mockTrans1);
      testDay.addTransaction(mockTrans2);
      testDay.calculateBalance();

      expect(testDay.credits, 5.00);
    });

    test('Day should return total of all debits when get debits is called', () {
      Day testDay = Day(mockDate);
      Transaction mockTrans1 = Transaction(mockDate);
      Transaction mockTrans2 = Transaction(mockDate);
      mockTrans1.setIsCredit(true);
      mockTrans1.setAmount(5.00);
      mockTrans2.setAmount(3.00);

      testDay.addTransaction(mockTrans1);
      testDay.addTransaction(mockTrans2);
      testDay.calculateBalance();

      expect(testDay.debits, -3.00);
    });

    test('Calculate balance adds credits and subtracts the debits', () {
      Day testDay = Day(mockDate);
      Transaction mockTrans1 = Transaction(mockDate);
      Transaction mockTrans2 = Transaction(mockDate);
      mockTrans1.setIsCredit(true);
      mockTrans1.setAmount(5.00);
      mockTrans2.setAmount(3.00);

      testDay.addTransaction(mockTrans1);
      testDay.addTransaction(mockTrans2);
      testDay.calculateBalance();

      expect(testDay.balance, 2.00);
    });

    test('toJson', () {
      Day testDay = Day(mockDate);
      Transaction fakeTrans = Transaction(mockDate);
      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      testDay.addTransaction(fakeTrans);

      Map<String,dynamic> testDayJson = testDay.toJson();

      expect(testDayJson['date']['monthName'], 'January');
      expect(testDayJson['transactions'].length, 1);
      expect(testDayJson['transactions']['0']['description'], 'fake');
      expect(testDayJson['transactions']['0']['value'], 20.00);
      expect(testDayJson['transactions']['0']['isCredit'], true);
      expect(testDayJson['transactions']['0']['isReoccurring'], true);
    });

    test('fromJson', () {
      Day testDay = Day(mockDate);
      Transaction fakeTrans = Transaction(mockDate);
      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      testDay.addTransaction(fakeTrans);

      Map<String,dynamic> fakeDayJson = testDay.toJson();

      Day actual = Day.fromJson(fakeDayJson);
      expect(actual.date.getTitle(), mockDate.getTitle());
      expect(actual.transactions.length, 1);
      expect(actual.transactions[0].value, 20.0);
      expect(actual.transactions[0].isCredit, true);
      expect(actual.transactions[0].isReoccurring, true);
    });
  });
}