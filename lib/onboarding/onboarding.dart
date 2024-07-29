import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/container1.dart';

class MyOnboarding extends StatefulWidget {
  const MyOnboarding({super.key});

  @override
  State<MyOnboarding> createState() => _MyOnboardingState();
}

class _MyOnboardingState extends State<MyOnboarding> {
  final CarouselController _carouselController = CarouselController();
  int _currentOnboard = 0;
  // final PageController _controller = PageController();

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'image': 'assets/food-sutherland.png',
      'text': 'Welcome!\nYour Culinary Adventure Begins Here 🍽️✨',
    },
    {
      'image': 'assets/sausage-cheese-pizza-slice.png',
      'text': 'Savor Every Moment With Our Curated Food Delight🍽️✨',
    },
    {
      'image': 'assets/sushi.png',
      'text': 'Welcome! Your Culinary Adventure Begins Here 🍽️✨',
    },
  ];

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
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Stack(children: [
          CarouselSlider(
            items: _carouselItems
                .map((item) => Builder(builder: (BuildContext context) {
                      return Positioned(
                        top: 100.h,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item['image'],
                                height: 333.46.h,
                                width: 350.w,
                              ),
                              // SizedBox(
                              //   height: 250.h,
                              // ),
                              Text(
                                item['text'],
                                style: GoogleFonts.inter(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(72, 70, 70, 1),
                                  height: (55.29 / 50).h,
                                ),
                              ),
                            ]),
                      );
                    }))
                .toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
              autoPlay: false,
              autoPlayInterval: const Duration(milliseconds: 1500),
              height: double.infinity,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentOnboard = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 25.h,
            left: 26.w,
            child: const OnBoardContainer(),
          ),
          Positioned(
            top: 520.h,
            left: 197.w,
            child: AnimatedSmoothIndicator(
              activeIndex: _currentOnboard,
              count: _carouselItems.length,
              effect: WormEffect(
                dotHeight: 8.h,
                dotWidth: 8.w,
                activeDotColor: const Color.fromRGBO(252, 171, 16, 1),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
