import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:quick_menu/models/menu_item.dart';

Future<bool> isNfcAvailable() async {
  return await NfcManager.instance.isAvailable();
}

Future<void> writeMenuToNfc(MenuItem menuItem) async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    debugPrint('NFC is not available on this device');
    return;
  }

  // Serialize the MenuItem to JSON
  String jsonMenuItem = jsonEncode(menuItem.toJson());

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      debugPrint('Tag is not NDEF compatible');
      return;
    }

    NdefMessage message = NdefMessage([
      NdefRecord.createMime(
        'application/json',
        Uint8List.fromList(utf8.encode(jsonMenuItem)),
      ),
    ]);

    try {
      await ndef.write(message);
      debugPrint('MenuItem written successfully to NFC tag');
    } catch (e) {
      debugPrint('Error writing to NFC: $e');
    } finally {
      NfcManager.instance.stopSession();
    }
  });
}

Future<MenuItem?> readMenuFromNfc() async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    debugPrint('NFC is not available on this device');
    return null;
  }

  Completer<MenuItem?> completer = Completer<MenuItem?>();

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
          String jsonString = String.fromCharCodes(record.payload);
          Map<String, dynamic> json = jsonDecode(jsonString);
          MenuItem menuItem = MenuItem(
            id: json['id'],
            name: json['name'],
            description: json['description'],
            price: json['price'],
            category: json['category'],
          );
          debugPrint(menuItem.toString());
          completer.complete(menuItem);
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
