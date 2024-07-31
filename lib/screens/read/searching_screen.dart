import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_menu/constant/app_color.dart';

import '../../services/nfc_service.dart';
import '../alert_box.dart';
import 'menu_screen.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  Future<void> _readingNfc() async {
    try {
      await readMenuFromNfc(context).then((menuModel) {
        if (menuModel != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MenuScreen(menu: menuModel),
            ),
          );
        }
      });
    } catch (e) {
      debugPrint('Error reading NFC: $e');

      showDialog(
        context: context.mounted ? context : context,
        builder: (context) => const AlertBox(
            title: 'Error',
            img: 'assets/images/fail.png',
            message:
                'An error occurred while reading the NFC tag. Please try again.'),
      );

      Navigator.push(
        context.mounted ? context : context,
        MaterialPageRoute(
          builder: (context) => const SizedBox(),
        ),
      );
    }
  }

  @override
  void initState() {
    _readingNfc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset("assets/images/searching.png"),
            ),
            const Text(
              "Searching for Tags",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 36.0),
              child: Text(
                "Keep your phone close to the tag",
                style: TextStyle(color: AppColors.textColor, fontSize: 18.0),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12.0)),
                      side: WidgetStateProperty.all(
                          const BorderSide(color: AppColors.textColor))),
                  child: const Text(
                    "Cancel",
                    style:
                        TextStyle(color: AppColors.textColor, fontSize: 18.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
