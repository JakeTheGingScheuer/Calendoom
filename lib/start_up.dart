import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_driving/models/dataStore.dart';
import 'package:test_driving/pages/calendar_screen.dart';


class StartUp extends StatelessWidget {

  final LocalStorage deviceStorage = LocalStorage('calendar_storage');
  DataStore calendar = DataStore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: deviceStorage.ready,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            setCalendar(snapshot.data);
            return
              ChangeNotifierProvider(
                builder: (context) => calendar,
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
        calendar = DataStore.fromJson(json);
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


