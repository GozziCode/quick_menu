import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:quick_menu/models/menu_model.dart';

Future<bool> isNfcAvailable() async {
  return await NfcManager.instance.isAvailable();
}

Future<String> writeMenuToNfc(Menu menu) async {
  String status = "";
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    print('NFC is not available on this device');
    status = "not available";
    return status;
  }

  // Serialize the MenuItem to JSON
  String jsonMenuItem = jsonEncode(menu.toJson());

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      print('Tag is not NDEF compatible');
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
      print('MenuItem written successfully to NFC tag');
      status = "MenuItem written successfully to NFC tag";
    } catch (e) {
      print('Error writing to NFC: $e');
    } finally {
      NfcManager.instance.stopSession();
    }
  });
  return status;
}

Future<Menu?> readMenuFromNfc() async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    print('NFC is not available on this device');
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
          String tryString = String.fromCharCodes(record.payload);
          String jsonString = tryString.substring(tryString.indexOf("{"));
          Map<String, dynamic> json = jsonDecode(jsonString);
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
