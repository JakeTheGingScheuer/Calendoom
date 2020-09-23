import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/day_transaction.dart';

class ReoccurringButton extends StatefulWidget{
  Transaction transaction;
  ReoccurringButton(this.transaction);
  @override
  State<StatefulWidget> createState() => ReoccurringButtonState(transaction);

}

class ReoccurringButtonState extends State<ReoccurringButton> {
  Transaction transaction;
  ReoccurringButtonState(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(child: Text('Reoccuring Payment',style: TextStyle(fontSize: 16, color: Colors.greenAccent))),
              CupertinoSwitch(
                activeColor: Colors.green,
                  key: Key('reoccuring'),
                  value: transaction.isReoccurring,
                  onChanged: (bool value) => setState(() {
                    transaction.setIsReoccurring(value);
                  })
    )]
    ));
  }
}