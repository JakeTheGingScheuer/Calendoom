import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/day_transaction.dart';

class CreditButton extends StatefulWidget{
  Transaction transaction;
  CreditButton(this.transaction);
  @override
  State<StatefulWidget> createState() => CreditButtonState(transaction);
}

class CreditButtonState extends State<CreditButton> {
  final Map<bool, Widget> choice = const <bool, Widget>{
    false: Text('Expense (-)'),
    true: Text('Income (+)')
  };

  Transaction transaction;
  CreditButtonState(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      child: CupertinoSegmentedControl(
        borderColor: Colors.green,
        selectedColor: Colors.green,
          groupValue: transaction.isCredit,
          onValueChanged: (bool value) => setState(() {
            transaction.setIsCredit(value);
          }),
          children: choice
      ),
    );
  }
}