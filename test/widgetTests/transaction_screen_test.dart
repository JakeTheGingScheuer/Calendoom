import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/day_transaction.dart';

void main() {
  group('widget tests for transaction', () {

//    testWidgets('Transaction description input works', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//
//      await tester.enterText(find.byKey(Key('descriptionInput')), 'BILL');
//
//      Finder descriptionInputFinder = find.text('BILL');
//
//      expect(descriptionInputFinder, findsOneWidget);
//    });
//
//    testWidgets('Transaction should have an description input field', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//
//      Finder descriptionInputFinder = find.byKey(Key('descriptionInput'));
//
//      expect(descriptionInputFinder, findsOneWidget);
//    });
//
//    testWidgets('Transaction should have an amount input field', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//
//      Finder amountInputFinder = find.byKey(Key('amountInput'));
//
//      expect(amountInputFinder, findsOneWidget);
//    });
//
//    testWidgets('Transaction amount input works', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//      await tester.enterText(find.byKey(Key('amountInput')), '23.00');
//
//      Finder amountInputFinder = find.text('23.00');
//
//      expect(amountInputFinder, findsOneWidget);
//    });
//
//    testWidgets('Transaction has a credit/debit switch', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//
//      Finder creditDebitFinder = find.byKey(Key('creditDebit'));
//
//      expect(creditDebitFinder, findsOneWidget);
//
//    });
//
//    testWidgets('Transaction has a reoccuring switch', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//
//      Finder reoccuringFinder = find.byKey(Key('reoccuring'));
//
//      expect(reoccuringFinder, findsOneWidget);
//
//    });
});}
//
//class MockMaterialApp extends StatelessWidget {
//  Day mockDay = Day(1,1,1);
//  LocalStorage storage = new LocalStorage('fakeStoreage');
//  Transaction testTransaction = Transaction();
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: TransactionScreen(testTransaction, mockDay, storage)
//    );
//  }
//}