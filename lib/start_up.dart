import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_driving/models/appState.dart';
import 'package:test_driving/pages/calendar_screen.dart';


class StartUp extends StatelessWidget {

  final LocalStorage deviceStorage = LocalStorage('calendar_storage');
  AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: deviceStorage.ready,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            setCalendar(snapshot.data);
            return
              ChangeNotifierProvider(
                builder: (context) => appState,
                child: CalendarScreen(deviceStorage)
              );
          } else {
            return loadScreen();
          }
        });
  }

  setCalendar(bool dataAvailable) {
    if (dataAvailable) {
      Map<String, dynamic> json = deviceStorage.getItem('calendar');
      if(json != null){
        appState = AppState.fromJson(json);
      }
    }
  }

  loadScreen() {
    return Scaffold(
        body: Center(
            child: CupertinoActivityIndicator()
        )
    );
  }
}


