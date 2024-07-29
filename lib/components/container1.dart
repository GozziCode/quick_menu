import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/read_write_screen.dart';
import '../screens/read_nfc_screen.dart';

class MyContainer1 extends StatelessWidget {
  const MyContainer1({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // child: Padding(
      //   padding: EdgeInsets.fromLTRB(14.w, 20.h, 14.w, 20.h),
      child: Container(
        height: 48.h,
        width: 382.w,
        decoration: BoxDecoration(
          color: Color.fromRGBO(252, 171, 16, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            top: BorderSide(
              width: 1.0.w,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(239, 239, 239, 1),
                  height: (19.6 / 16).h,
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 20.h,
                width: 20.w,
                child: Icon(Icons.arrow_forward_outlined,
                    color: const Color.fromRGBO(239, 239, 239, 1)),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

class MyContainer2 extends StatelessWidget {
  const MyContainer2({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(14.w, 20.h, 14.w, 20.h),
        child: Container(
          height: 48.h,
          width: 381.w,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(252, 171, 16, 1),
            borderRadius: BorderRadius.circular(8),
            border: Border(
              top: BorderSide(
                width: 1.0.w,
                color: Color.fromRGBO(239, 239, 239, 1),
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    height: (19.6 / 16).h,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 20.h,
                  width: 20.w,
                  child: Icon(Icons.camera_alt_outlined,
                      color: const Color.fromRGBO(239, 239, 239, 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardContainer extends StatelessWidget {
  const OnBoardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 380.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contect) => ReadandWriteNfc()));
            },
            child: Container(
              width: 281.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(252, 171, 16, 1),
                borderRadius: BorderRadius.circular(8),
                border: Border(
                  top: BorderSide(
                    width: 1.0.w,
                    color: Color.fromRGBO(239, 239, 239, 1),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Read Menu',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(66, 66, 66, 1),
                      height: (19.36 / 16).h,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20.h,
                    width: 20.w,
                    child: Icon(Icons.arrow_forward_outlined,
                        color: const Color.fromRGBO(66, 66, 66, 1)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {},
            child: Container(
                width: 83.w,
                height: 48.h,
                decoration: BoxDecoration(
                  //color: Color.fromRGBO(252, 171, 16, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(180, 180, 180, 1),
                  ),
                ),
                child: Icon(Icons.add_circle_outline_rounded)),
          ),
        ],
      ),
    );
  }
}
