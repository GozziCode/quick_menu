import 'dart:async';
import 'dart:convert';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:quick_menu/models/menu_model.dart';

Future<bool> isNfcAvailable() async {
  return await NfcManager.instance.isAvailable();
}

Future<String> writeMenuToNfc(Menu menu) async {
  String status = "";
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    status = "not available";
    return status;
  }

  // Serialize the MenuItem to JSON
  String jsonMenuItem = jsonEncode(menu.toJson());

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      status = "tag not compatible";
      return;
    }

    NdefMessage message = NdefMessage([
      NdefRecord.createText(
        jsonMenuItem,
      ),
    ]);

    try {
      await ndef.write(message);
      status = "MenuItem written successfully to NFC tag";
    } catch (e) {
      status = e.toString();
    } finally {
      NfcManager.instance.stopSession();
    }
  });
  return status;
}

Future<Menu?> readMenuFromNfc() async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    return null;
  }

  Completer<Menu?> completer = Completer<Menu?>();

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      completer.complete(null);
      return;
    }

    try {
      var records = await ndef.read();

      for (NdefRecord record in records.records) {
        if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown) {
          // String jsonString = String.fromCharCodes(record.payload);
          //print(jsonString);
          String tryString = String.fromCharCodes(record.payload);
          String jsonString = tryString.substring(tryString.indexOf('{'));
          Map<String, dynamic> json = jsonDecode(jsonString);
          //print(json);
          Menu menu = Menu.fromJson(json);

          completer.complete(menu);

          return;
        }
      }
      completer.complete(null);
    } catch (e) {
      completer.completeError(e);
    } finally {
      NfcManager.instance.stopSession();
    }
  });

  return completer.future;
}
