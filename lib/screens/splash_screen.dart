import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/onboarding/onboarding.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  startTimer() async {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (c) => const MyOnboarding(),
            //const WriteScreen()

            // const OnBoardingScreen()
            // const StartScreen()
          ));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // final double textScaleFactor = MediaQuery.textScalerOf(context).scale(1.5);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Splash_Screen.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(
            top: 212.h,
            left: 121.41,
            child: SizedBox(
              height: 123.63.h,
              width: 181.33.w,
              child: Image.asset('assets/Group.png'),
            ),
          ),
          Positioned(
            top: 341.39.h,
            left: 115.w,
            child: SizedBox(
              height: 27.h,
              width: 196.w,
              child: Text(
                "Kimiko's Place",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
