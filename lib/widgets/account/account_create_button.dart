import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/account.dart';
import 'package:test_driving/pages/account_create_form.dart';

class AccountCreateButton extends StatelessWidget{
  List<CreditCardAccount> accounts;
  CreditCardAccount newAccount = CreditCardAccount(0, "");
  AccountCreateButton(this.accounts);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: CupertinoButton(
        color: Colors.green,
        child: Text("New Account"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute( builder: (context) => NewAccountForm(newAccount, accounts)));},
      ),
    );
  }
}