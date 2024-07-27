import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/menu_item.dart';
import '../providers/menu_provider.dart';

class NfcService {
  static Future<void> readNfc(BuildContext context) async {
    try {
      var availability = await FlutterNfcKit.nfcAvailability;
      if (availability != NFCAvailability.available) {
        if (context.mounted) {
          _showErrorDialog(context, 'NFC is not available');
        }
        return;
      }

      var tag = await FlutterNfcKit.poll(timeout: const Duration(seconds: 10));
      if (tag.ndefAvailable == true) {
        var records = await FlutterNfcKit.readNDEFRecords(cached: false);
        if (records.isNotEmpty) {
          var record = records.first;
          if (record.payload != null) {
            String payload = utf8.decode(record.payload!);
            var jsonData = json.decode(payload) as List<dynamic>;
            var menuItems =
                jsonData.map((item) => MenuItem.fromJson(item)).toList();
            if (context.mounted) {
              Provider.of<MenuProvider>(context, listen: false)
                  .setMenuItems(menuItems);
            }
          } else {
            if (context.mounted) {
              _showErrorDialog(context, 'NDEF record payload is null');
            }
          }
        } else {
          if (context.mounted) {
            _showErrorDialog(context, 'No NDEF records found');
          }
        }
      } else {
        if (context.mounted) {
          _showErrorDialog(context, 'NDEF is not available on this tag');
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorDialog(context, 'Error reading NFC tag: $e');
      }
    } finally {
      await FlutterNfcKit.finish();
    }
  }

  static Future<void> writeNfc(
      BuildContext context, List<MenuItem> menuItems) async {
    var message = [
      ndef.TextRecord(
        text: json.encode(menuItems.map((e) => e.toJson()).toList()),
      ),
    ];

    try {
      var availability = await FlutterNfcKit.nfcAvailability;
      if (availability != NFCAvailability.available) {
        if (context.mounted) {
          _showErrorDialog(context, 'NFC is not available');
        }
        return;
      }

      var tag = await FlutterNfcKit.poll(timeout: const Duration(seconds: 10));
      if (tag.ndefWritable == true) {
        await FlutterNfcKit.writeNDEFRecords(message);
        if (context.mounted) {
          _showSuccessDialog(
              context, 'Menu items successfully written to NFC tag!');
        }
      } else {
        if (context.mounted) {
          _showErrorDialog(context, 'NDEF is not writable on this tag');
        }
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorDialog(context, 'Error writing NFC tag: $e');
      }
    } finally {
      await FlutterNfcKit.finish();
    }
  }

  static void _showErrorDialog(BuildContext context, String message) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  static void _showSuccessDialog(BuildContext context, String message) {
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
