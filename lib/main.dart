import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

void main() => runApp(GoldMedalFitnessApp());
final LocalStorage main_storage = new LocalStorage('info');
bool firstTime = main_storage.getItem("first") ?? true;

double screenWidth, screenHeight;

class GoldMedalFitnessApp extends StatelessWidget {
  Widget build(BuildContext context) {
    
    if (firstTime == true) {
      main_storage.setItem("hasImage", false);
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
         return Center(child: Text("$i"));
       }
     },
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home")
      ),
      child: Center(
          child: BarcodeWidget()
      )
    );
  }
}

class BarcodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (main_storage.getItem("hasImage") == false) {
      return Image.asset(
          "assets/no_bar_code.png",
          height: screenWidth/2,
          width: screenWidth/2
      );
    }
  }
}