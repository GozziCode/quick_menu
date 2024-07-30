import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/constant/app_color.dart';



class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;
  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 281.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            top: BorderSide(
              width: 1.0.w,
              color: AppColors.borderColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
                height: (19.36 / 16).h,
              ),
            ),
            const SizedBox(width: 10),
            icon == null
                ? const SizedBox()
                : SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: icon,
                  ),
          ],
        ),
      ),
    );
  }
}
