import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_menu/constant/app_color.dart';

import '../../services/nfc_service.dart';
import '../menu_screen.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  Future<void> _readingNfc() async {
    try {
      await readMenuFromNfc().then((menuModel) {
        if (menuModel != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MenuScreen(menu: menuModel),
            ),
          );
        } else {
          // Handle the case when no valid NFC data is found
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('No Menu Data'),
              content: Text('No valid menu data was found on the NFC tag.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      }).catchError((error) {
        // Handle errors and prompt the user to try again
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(
                'An error occurred while reading the NFC tag. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
// Try again
                },
                child: Text('Try Again'),
              ),
            ],
          ),
        );
      });
    } catch (e) {
      print('Error reading NFC: $e');
      Navigator.push(
        context,
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
              child: Image.asset("assets/images/read.png"),
            ),
            Text(
              "Searching for Tags",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 36.0),
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
                          EdgeInsets.symmetric(vertical: 12.0)),
                      side: WidgetStateProperty.all(
                          BorderSide(color: AppColors.textColor))),
                  child: Text(
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
