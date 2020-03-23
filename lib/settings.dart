import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'storage_utils.dart';


class SettingsTab extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsTab> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
   Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Settings")
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: Text("Scan Barcode"),
          onPressed: scan,
        )
      )
    );
  }


  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }

    setLocalItem("barcode", this.barcode);
  }

}

