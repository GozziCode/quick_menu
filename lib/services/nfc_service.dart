import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:quick_menu/models/menu_model.dart';

Future<bool> isNfcAvailable() async {
  return await NfcManager.instance.isAvailable();
}

Future<void> writeMenuToNfc(MenuModel menuModel) async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    print('NFC is not available on this device');
    return;
  }

  // Serialize the MenuItem to JSON
  String jsonMenuItem = jsonEncode(menuModel.toJson());

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      print('Tag is not NDEF compatible');
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
      print('MenuItem written successfully to NFC tag');
    } catch (e) {
      print('Error writing to NFC: $e');
    } finally {
      NfcManager.instance.stopSession();
    }
  });
}

Future<MenuModel?> readMenuFromNfc() async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    print('NFC is not available on this device');
    return null;
  }

  Completer<MenuModel?> completer = Completer<MenuModel?>();

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
          MenuModel menuItem = MenuModel(
            name: json['name'],
            description: json['description'],
            price: json['price'],
            category: json['category'],
          );
          print(menuItem);
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
