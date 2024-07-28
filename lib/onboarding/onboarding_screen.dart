import 'package:flutter/material.dart';
import 'package:quick_menu/onboarding/page1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page2.dart';
import 'page3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onPage3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onPage3 = (index == 2);
            });
          },
          children: const [
            EnableNfcScreen(),
            TapNfcScreen(),
            ScanQrScreen(),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Column(
            children: [
              Text('Back'),
              SizedBox(height: 32),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                onDotClicked: (index) => _controller.animateToPage(index,
                    duration: const Duration(microseconds: 600),
                    curve: Curves.easeIn),
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Color.fromRGBO(252, 171, 16, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
