import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/screens/onboarding/onboarding.dart';
import 'package:quick_menu/services/nfc_service.dart';

import 'onboarding/widgets/enable_nfc_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkNfcAndNavigate() async {
    bool nfcEnabled = await isNfcAvailable();

    Timer(const Duration(seconds: 2), () {
      if (nfcEnabled) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (c) => const OnboardingScreen(),
            ));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EnableNfcScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkNfcAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Splash_Screen.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 150.h),
            SizedBox(
              height: 123.63.h,
              width: 181.33.w,
              child: Image.asset('assets/images/Group.png'),
            ),
            Text(
              "Kimiko's Place",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
