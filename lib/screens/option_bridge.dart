import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_menu/constant/app_color.dart';
import 'package:quick_menu/screens/read/searching_screen.dart';
import 'package:quick_menu/screens/write/menu_list_screen.dart';

import '../models/menu_model.dart';

class OptionBridge extends StatelessWidget {
  const OptionBridge({super.key});

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Select an option",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Expanded(
              child: NfcChoice(
                text: 'Read a Menu',
                imageUrl: 'assets/images/read.png',
                screen: SearchingScreen(),
              ),
            ),
            Expanded(
              child: NfcChoice(
                text: 'Write a Menu',
                imageUrl: 'assets/images/write.png',
                screen: MenuListScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NfcChoice extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Widget screen;

  const NfcChoice(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: AppColors.primaryColor.withOpacity(0.25)),
        child: Column(
          children: [
            Expanded(child: Image.asset(imageUrl)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.0),
                      color: AppColors.primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Icon(
                      CupertinoIcons.arrow_up_right,
                      size: 36.0,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
