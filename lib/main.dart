import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
import 'home.dart';
import 'settings.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

LocalStorage mainStorage;
bool firstTime;
double screenWidth, screenHeight;

void main() {

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    
  return runApp(GoldMedalFitnessApp());
}



class GoldMedalFitnessApp extends StatelessWidget {
  Widget build(BuildContext context) {
    
    mainStorage = new LocalStorage('info');
    firstTime = mainStorage.getItem("first") ?? true;

    if (firstTime == true) {
      mainStorage.setItem("hasImage", false);
    }
    
    
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            title: Text("Settings"),
          )
        ]
     ),
     tabBuilder: (context, i) {
       if (i == 0) {
         return Center(child: HomeTab());
       } else {
         return Center(child: SettingsTab());
       }
     },
    );
  }
}

