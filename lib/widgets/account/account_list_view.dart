import 'package:flutter/material.dart';
import 'package:test_driving/models/account.dart';
import 'package:test_driving/models/account_transaction.dart';
import 'package:test_driving/pages/account_transaction_form.dart';

class AccountListView extends StatefulWidget{
  List<CreditCardAccount> accounts;
  AccountListView(this.accounts);

  @override
  State<StatefulWidget> createState() => AccountListState(accounts);
}

class AccountListState extends State<AccountListView>{
  List<CreditCardAccount> accounts;
  AccountListState(this.accounts);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            height: 300,
            child: accountList(accounts)
        )
    );
  }

  ListView accountList(List<CreditCardAccount> accounts) {
    List<GestureDetector> tiles = List<GestureDetector>();

    accounts.forEach((account) =>
        tiles.add(accountTile(account, context)));
    return ListView(
        children: tiles
    );
  }

  GestureDetector accountTile(CreditCardAccount account, BuildContext context){
    AccountTransaction trans = new AccountTransaction(0, false);
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute( builder:(context) => AccountTransactionForm(account, trans, accounts)));},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Text(account.accountName, style: TextStyle(color: Colors.greenAccent)),
              trailing: Text('Available: \$' + account.availableBalance.toStringAsFixed(2), style: TextStyle(color: Colors.greenAccent),),
            )
        ),
      ),
    );
  }
}