import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:gmf_app/settings.dart';
import 'main.dart';
import 'styles.dart';
import 'settings.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

LocalStorage mainStorage = new LocalStorage('info');
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
    if (mainStorage.getItem("hasImage") == false) {
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
        child: Text(mainStorage.getItem("barcode"))
      );
    }
  }
}