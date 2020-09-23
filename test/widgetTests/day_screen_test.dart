import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';
import 'package:test_driving/main.dart';
import 'package:test_driving/models/day.dart';

void main(){
//  group('widget tests for day',() {
//    testWidgets('Day has a button for adding a new transaction', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//      Finder addTransactionButtonFinder = find.byKey(Key('newTransaction'));
//      expect(addTransactionButtonFinder, findsOneWidget);
//    });
//    testWidgets('Day has a list view of transactions', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//      Finder transactionListFinder = find.byKey(Key('transactionList'));
//      expect(transactionListFinder, findsOneWidget);
//    });
//    testWidgets('Day displays weekday name and day number', (WidgetTester tester) async {
//      await tester.pumpWidget(MockMaterialApp());
//
//      Finder dayTitleFinder = find.byKey(Key('dayTitle'));
//
//      expect(dayTitleFinder, findsOneWidget);
//      expect(find.text('Monday January 1'), findsOneWidget);
//
//    });
//
//  });
//}
//
//class MockMaterialApp extends StatelessWidget {
//  Day testDay = Day(1,1,1);
//  LocalStorage storage = new LocalStorage('fakeStorage');
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: DayScreen(testDay, storage)
//    );
//  }
}