import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Settings")
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: Text("Scan Barcode"),
          onPressed: () {},
        )
      )
    );
  }
}