import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/account.dart';
import 'package:test_driving/models/account.dart' as prefix0;
import 'package:test_driving/models/account_transaction.dart';
import 'package:test_driving/widgets/account/account_transaction_type_switch.dart';

class AccountTransactionForm extends StatelessWidget {

  List<CreditCardAccount> accounts;
  CreditCardAccount account;
  AccountTransaction trans;
  AccountTransactionForm(this.account, this.trans, this.accounts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CupertinoNavigationBar(middle:Text(account.accountName, style: TextStyle(color: Colors.green),), actionsForegroundColor: Colors.green, backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                accountInfo(),
                SizedBox(height: 40),
                amountInput(),
                AccountTransactionTypeSwitch(trans),
                SizedBox(height: 60),
                CupertinoButton(
                  child:Text('Update Account'),
                  color: Colors.blue,
                  onPressed: () => addTransactionButton(context),
                ),
                SizedBox(height: 60),
                CupertinoButton(
                  child:Text('Delete Account'),
                  color: Colors.red,
                  onPressed: () => deleteAccount(context),
                )
              ],
            )
        ),
      ),
    );
  }

  Widget accountInfo(){
    String total = account.creditLineAmount.toStringAsFixed(2);
    String balance = (account.creditLineAmount - account.availableBalance).toStringAsFixed(2);
    String available = account.availableBalance.toStringAsFixed(2);
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          Container(child: Text("Total Credit: \$"+ total, style: TextStyle(color: Colors.green, fontSize: 14))),
          SizedBox(height: 5),
          Container(child: Text("Balance: \$"+ balance, style: TextStyle(color: Colors.red, fontSize: 14))),
          SizedBox(height: 5),
          Container(child: Text("Available: \$"+ available, style: TextStyle(color: Colors.greenAccent, fontSize: 20)))
        ],
      ),
    );
  }

  Widget amountInput(){
    return Container(
        padding: EdgeInsets.all(30),
        child: CupertinoTextField(
            style: TextStyle(color: Colors.greenAccent),
            cursorColor: Colors.green,
            prefix: Text(' \$', style: TextStyle(color: Colors.green),),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            placeholder: 'amount',
            key: Key('amountInput'),
            onChanged: (input) => this.trans.setAmount(double.parse(input))));
  }

  addTransactionButton(BuildContext context) {
    account.addTransaction(trans);
    Navigator.pop(context);
  }

  deleteAccount(BuildContext context){
    accounts.remove(this.account);
    Navigator.pop(context);
  }
}