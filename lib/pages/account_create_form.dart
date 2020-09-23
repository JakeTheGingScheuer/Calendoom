import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/account.dart';

class NewAccountForm extends StatelessWidget {
  CreditCardAccount account;
  List<CreditCardAccount> accounts;

  NewAccountForm(this.account, this.accounts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: CupertinoNavigationBar(middle:Text("New Account", style: TextStyle(color: Colors.green),), actionsForegroundColor: Colors.green, backgroundColor: Colors.black),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 140),
                    creditLineAmountInput(),
                    accountNameInput(),
                    SizedBox(height: 40),
                    addAccountToListButton(context)
                  ])),
        )
    );
  }

  Widget accountNameInput(){
    return Container(
        padding: EdgeInsets.all(30),
        child:CupertinoTextField(
            style: TextStyle(color: Colors.greenAccent),
            cursorColor: Colors.green,
            placeholder: 'Account Name',
            key: Key('accountNameInput'),
            onChanged: (input) => this.account.setAccountName(input)));
  }

  Widget creditLineAmountInput(){
    return Container(
        padding: EdgeInsets.all(30),
        child: CupertinoTextField(
            style: TextStyle(color: Colors.greenAccent),
            cursorColor: Colors.green,
            prefix: Text(' \$', style: TextStyle(color: Colors.green),),
            keyboardType: TextInputType.numberWithOptions(),
            placeholder: 'Credit Line Amount',
            key: Key('creditLineAmount'),
            onChanged: (input) => this.account.setCreditLineAmount(double.parse(input))));
  }

  Widget addAccountToListButton(BuildContext context){
    return CupertinoButton(
        color: Colors.blue,
        child: Text("Create Account"),
        onPressed: () => addAccountToList(context)
    );
  }

  addAccountToList(BuildContext context) {
    this.accounts.add(this.account);
    Navigator.pop(context);
  }
}