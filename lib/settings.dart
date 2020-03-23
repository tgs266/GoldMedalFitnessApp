import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'scanner.dart';

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
          onPressed: () {
            String barcode = "";
            LocalStorage mainStorage = new LocalStorage('info');
            scan(barcode);

            mainStorage.setItem("barcode", barcode);

            CupertinoAlertDialog(actions: <Widget>[
              Text(barcode)
            ],);
          },
        )
      )
    );
  }
  
}