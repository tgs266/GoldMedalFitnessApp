import 'package:flutter/cupertino.dart';
import 'package:gmf_app/settings.dart';
import 'settings.dart';
import 'storage_utils.dart';

double screenWidth, screenHeight;


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
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
    if (getLocalItem("hasBarcodeImg", false) == false) {
      return Center(
          child: CupertinoButton(
              child: Text(
              "Please go to settings to add your barcode",
              style: CupertinoTheme.of(context).textTheme.actionTextStyle
            ),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) {
                  return SettingsTab();
                })
              );
            }
          )
          
       
      );
    } else {
      return Center(
        child: Text(getLocalItem("barcode", "An Error Occured"))
      );
    }
  }
}