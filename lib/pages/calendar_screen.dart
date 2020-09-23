import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/appState.dart';
import 'package:test_driving/models/account.dart';
import 'package:test_driving/widgets/account/account_list_view.dart';
import 'package:test_driving/widgets/calendar/calendar_view.dart';
import 'package:test_driving/widgets/account/account_create_button.dart';

class CalendarScreen extends StatelessWidget {

  LocalStorage deviceStorage;
  List<CreditCardAccount> accounts;
  CalendarScreen(this.deviceStorage);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    appState.update();
    autoSave(appState);
    accounts = appState.accounts;
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        appBar: CupertinoNavigationBar(
              actionsForegroundColor: Colors.green,
              backgroundColor: Colors.black),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              CalendarView(appState),
              AccountCreateButton(accounts),
              AccountListView(accounts)
            ],
          ),
        )
    );
  }

  autoSave(AppState appState){
    deviceStorage.setItem('calendar', appState.toJson());
  }
}

