import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_color.dart';
import 'read/searching_screen.dart';
import 'write/menu_list_screen.dart';

class OptionBridge extends StatelessWidget {
  const OptionBridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16),
              child: Text(
                "Select an option",
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
            ),
            const Expanded(
              child: NfcChoice(
                text: 'Read a Menu',
                imageUrl: 'assets/images/read.png',
                screen: SearchingScreen(),
              ),
            ),
            const Expanded(
              child: NfcChoice(
                text: 'Write a Menu',
                imageUrl: 'assets/images/write.png',
                screen: MenuListScreen(),
              ),
            ),
            const SizedBox(height: 10)
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
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        padding: const EdgeInsets.all(15.0),
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
                  style: GoogleFonts.inter(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.0),
                      color: AppColors.primaryColor),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      CupertinoIcons.arrow_up_right,
                      size: 36.0,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
