import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/date.dart';
import 'package:test_driving/models/day_transaction.dart';

DateTime dateTime = new DateTime(2000, 1, 1);
Date fakeDate = Date(dateTime);

void main() {
  group('unit tests for transaction', () {
    test('Transaction initialization', () {
      Transaction testTransaction = Transaction(fakeDate);
      expect(testTransaction.isReoccurring, false);
      expect(testTransaction.isCredit, false);
      expect(testTransaction.description, 'No Description');
      expect(testTransaction.value, 0.00);
    });

    test('Transaction value is a debit and negative by default', () {
      Transaction testTransaction = Transaction(fakeDate);
      testTransaction.setAmount(5.00);
      expect(testTransaction.value, -5.00);
    });

    test('Transaction is positive if isCredit', () {
      Transaction testTransaction = Transaction(fakeDate);
      testTransaction.setAmount(5.00);
      testTransaction.setIsCredit(true);
      expect(testTransaction.value, 5.00);
    });

    test('persists data appropriatley', () {
      Transaction testTransaction = Transaction(fakeDate);
      testTransaction.setDescription('fake');
      testTransaction.setAmount(20.00);
      testTransaction.setIsCredit(true);
      testTransaction.setIsReoccurring(true);

      Map<String, dynamic> actualMap = testTransaction.toJson();
      Transaction after = Transaction.fromJson(actualMap);
      expect(after.description, 'fake');
      expect(after.value, 20.00);
      expect(after.isReoccurring, true);
      expect(after.isCredit, true);
    });
  });
}
