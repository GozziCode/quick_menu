import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/components/container1.dart';

class EnableNfcScreen extends StatelessWidget {
  const EnableNfcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Enable_NFC.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 98.h,
              left: 45.w,
              child: Container(
                height: 340.h,
                width: 340.w,
                child: Image.asset('assets/nfc_frame.png'),
              ),
            ),
            Positioned(
              top: 637.14.h,
              left: 24.w,
              child: Container(
                margin: EdgeInsets.all(10.r),
                height: 158.h,
                width: 382.w,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        height: 78.h,
                        width: 382.w,
                        child: Text(
                          'Please enable NFC on your device to continue',
                          style: GoogleFonts.inter(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(72, 70, 70, 1),
                            height: (38.73 / 32).h,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 22.0.h),
                      child: MyContainer1(
                        text: 'Open Settings',
                        onTap: () {
                          AppSettings.openAppSettingsPanel(
                              AppSettingsPanelType.nfc);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
