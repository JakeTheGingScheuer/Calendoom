import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/day_transaction.dart';
import '../models/day.dart';
import 'day_transaction_screen.dart';

class DayScreen extends StatefulWidget {
  Day day;
  DayScreen(this.day);

  @override
  State<StatefulWidget> createState() => DayScreenState(day);
}

class DayScreenState extends State<DayScreen>{
  Day day;
  DayScreenState(this.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CupertinoNavigationBar(middle:Text(day.dayKey(),style: TextStyle(color: Colors.green),), actionsForegroundColor: Colors.green, backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              SizedBox(height: 15),
              Container(
                  key: Key('transactionList'),
                  height:400,
                  child: transactionList(day)),
              CupertinoButton(
                  key: Key('newTransaction'),
                  child: Text('New Transaction'),
                  color: Colors.green,
                  onPressed: () => addNewTransaction(day, context))
            ],
          ),
        ),
      )
    );
  }

  addNewTransaction(Day day, BuildContext context) {
    Transaction transaction = Transaction(day.date);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TransactionScreen(transaction, day)));
  }

  ListView transactionList(Day day) {
    List<Container> tiles = List<Container>();

    day.transactions.forEach((trans) =>
        tiles.add(transactionTile(trans)));
    return ListView(
      children: tiles
    );
  }

  Container transactionTile(Transaction trans){
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        leading: CupertinoButton(child: Icon(CupertinoIcons.delete_solid, color: Colors.red), onPressed: ()=> delete(trans)),
        title: Container(child: Text(trans.description,style: TextStyle(color: Colors.white70, fontSize: 18))),
        trailing: Container(child: Text(trans.value.toStringAsFixed(2), style: TextStyle(color: Colors.greenAccent, fontSize: 18))),
      ),
    );
  }

  delete(Transaction trans){
    day.deleteTransaction(trans);
    setState(() {});
  }
}