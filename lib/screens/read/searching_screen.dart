import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_menu/constant/app_color.dart';

import '../../models/menu_model.dart';
import '../menu_screen.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  Future<void> _readingNfc() async {
    try {
      // List<MenuModel>? menuItem = await readMenuFromNfc();
      List<MenuModel>? menuItem = [
        MenuModel(
            name: "name",
            description: "description",
            price: 23.0,
            category: "category"),
        MenuModel(
            name: "name",
            description: "description",
            price: 23.0,
            category: "category"),
        MenuModel(
            name: "name",
            description: "description",
            price: 23.0,
            category: "category1"),
        MenuModel(
            name: "name",
            description: "description",
            price: 23.0,
            category: "category1"),
      ];

      final menu = Menu.fromList(menuItem);

      if (menuItem != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuScreen(menu: menu),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SizedBox(),
          ),
        );
      }
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
