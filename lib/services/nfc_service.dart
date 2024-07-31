import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../models/menu_model.dart';
import '../screens/alert_box.dart';

Future<bool> isNfcAvailable() async {
  return await NfcManager.instance.isAvailable();
}

Future<String> writeMenuToNfc(Menu menu, BuildContext context) async {
  String status = "";
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    debugPrint('NFC is not available on this device');
    status = "NFC is not available on this device";
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertBox(
          title: 'Error',
          img: 'assets/images/fail.png',
          message: status,
        ),
      );
    }
    return status;
  }

  // Serialize the MenuItem to JSON
  String jsonMenuItem = jsonEncode(menu.toJson());

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      debugPrint('Tag is not NDEF compatible');
      status = "Tag not compatible";
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertBox(
            title: 'Error',
            img: 'assets/images/fail.png',
            message: status,
          ),
        );
      }
      return;
    }

    NdefMessage message = NdefMessage([
      NdefRecord.createText(
        jsonMenuItem,
      ),
    ]);

    try {
      await ndef.write(message);
      debugPrint('MenuItem written successfully to NFC tag');
      status = "MenuItem written successfully to NFC tag";
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertBox(
              title: 'Success',
              img: 'assets/images/success.png',
              message: status),
        );
      }
    } catch (e) {
      debugPrint('Error writing to NFC: $e');
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertBox(
            title: 'Error',
            img: 'assets/images/fail.png',
            message: e.toString(),
          ),
        );
      }
    } finally {
      NfcManager.instance.stopSession();
    }
  });
  return status;
}

Future<Menu?> readMenuFromNfc(BuildContext context) async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    debugPrint('NFC is not available on this device');
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => const AlertBox(
            title: 'Error',
            img: 'assets/images/fail.png',
            message: 'NFC is not available on this device'),
      );
    }
    return null;
  }

  Completer<Menu?> completer = Completer<Menu?>();

  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    var ndef = Ndef.from(tag);

    if (ndef == null) {
      completer.complete(null);
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertBox(
              title: 'Error',
              img: 'assets/images/fail.png',
              message: 'No data found'),
        );
      }
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
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) => const AlertBox(
                title: 'Success',
                img: 'assets/images/success.png',
                message:
                    'Update on the product details has been recorded successfully',
              ),
            );
          }
          return;
        }
      }
      completer.complete(null);
    } catch (e) {
      completer.completeError(e);
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertBox(
              title: 'Error',
              img: 'assets/images/fail.png',
              message: e.toString()),
        );
      }
    } finally {
      NfcManager.instance.stopSession();
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertBox(
              title: 'Error',
              img: 'assets/images/fail.png',
              message: 'Session Time Out, please try again.'),
        );
      }
    }
  });

  return completer.future;
}
