import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_color.dart';

class EnableNfcScreen extends StatelessWidget {
  const EnableNfcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 60.h),
              SizedBox(
                height: 78.h,
                width: 382.w,
                child: Text(
                  'Please enable NFC on your device to continue',
                  style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              SizedBox(
                height: 250.h,
                width: 250.w,
                child: SvgPicture.asset('assets/svgs/phone.svg'),
              ),
              SizedBox(height: 150.h),
              SizedBox(
                height: 104.h,
                width: 382.w,
                child: SvgPicture.asset('assets/svgs/setting.svg'),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  AppSettings.openAppSettingsPanel(AppSettingsPanelType.nfc);
                },
                child: Container(
                    width: double.infinity,
                    height: 52.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: AppColors.borderColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Open Settings',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                            height: (19.36 / 16).h,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward,
                            color: AppColors.iconColor),
                      ],
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
