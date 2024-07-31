import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_menu/constant/app_color.dart';

class AlertBox extends StatelessWidget {
  final String title, message, img;
  const AlertBox(
      {super.key,
      required this.title,
      required this.message,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: EdgeInsets.all(24.0.w),
      content: SizedBox(
        width: 300.w,
        height: 180.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              img,
              height: 70.h,
              width: 70.w,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
