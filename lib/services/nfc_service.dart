// lib/nfc_service.dart
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
        throw Exception('NFC is not available');
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
            throw Exception('NDEF record payload is null');
          }
        }
      }
    } catch (e) {
      debugPrint('Error reading NFC tag: $e');
    } finally {
      await FlutterNfcKit.finish();
    }
  }

  static Future<void> writeNfc(List<MenuItem> menuItems) async {
    var message = [
      ndef.TextRecord(
        text: json.encode(menuItems.map((e) => e.toJson()).toList()),
      ),
    ];

    try {
      var availability = await FlutterNfcKit.nfcAvailability;
      if (availability != NFCAvailability.available) {
        throw Exception('NFC is not available');
      }

      var tag = await FlutterNfcKit.poll(timeout: const Duration(seconds: 10));
      if (tag.ndefWritable == true) {
        await FlutterNfcKit.writeNDEFRecords(message);
      }
    } catch (e) {
      print('Error writing NFC tag: $e');
    } finally {
      await FlutterNfcKit.finish();
    }
  }
}
