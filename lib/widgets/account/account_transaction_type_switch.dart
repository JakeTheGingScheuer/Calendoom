import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/account_transaction.dart';

class AccountTransactionTypeSwitch extends StatefulWidget{
  AccountTransaction trans;
  AccountTransactionTypeSwitch(this.trans);
  @override
  State<StatefulWidget> createState() => AccountTransactionTypeSwitchState(trans);
}

class AccountTransactionTypeSwitchState extends State<AccountTransactionTypeSwitch> {
  AccountTransaction trans;
  AccountTransactionTypeSwitchState(this.trans);
  final Map<bool, Widget> choice = const <bool, Widget>{
    false: Text('Purchase'),
    true: Text('Payment')
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      child: CupertinoSegmentedControl(
          borderColor: Colors.green,
          selectedColor: Colors.green,
          groupValue: trans.isPayment,
          onValueChanged: (bool value) => setState(() {
            trans.setIsPayment(value);
          }),
          children: choice
      ),
    );
  }
}