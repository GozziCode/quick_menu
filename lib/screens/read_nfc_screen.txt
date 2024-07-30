import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ReadNfcScreen extends StatelessWidget {
  const ReadNfcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
              left: 96.05.w,
              child: SizedBox(
                height: 409.19.h,
                width: 294.9.w,
                child: Image.asset('assets/tap_nfc.png'),
              ),
            ),
            Positioned(
              top: 637.h,
              left: 24.w,
              child: Center(
                child: SizedBox(
                  //margin: EdgeInsets.all(10.r),
                  height: 158.h,
                  width: 382.w,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 78.h,
                          width: 382.w,
                          child: Text(
                            'Tap your device on Tag to view menu',
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
                        // child:
                        //  MyContainer1(
                        //     text: 'Connect',
                        //     onTap: () {
                        //       //connect to tag
                        //     }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
