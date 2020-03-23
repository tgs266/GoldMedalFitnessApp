import 'package:flutter/cupertino.dart';
import 'home.dart';
import 'settings.dart';
import 'storage_utils.dart';


bool firstTime;
double screenWidth, screenHeight;

void main() {

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    
  return runApp(GoldMedalFitnessApp());
}



class GoldMedalFitnessApp extends StatelessWidget {
  Widget build(BuildContext context) {
  
   
    if (existsInStorage("firstTime") == false) {
      setLocalItem("hasBarcodeImg", false);
      setLocalItem("firstTime", false);
      setLocalItem("barcode", "");
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

