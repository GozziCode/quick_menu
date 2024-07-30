import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/screens/menu_screen.dart';
import 'package:quick_menu/screens/option_bridge.dart';
import 'package:quick_menu/screens/write/add_product_screen.dart';

import '../../components/action_button.dart';
import '../../constant/app_color.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/food-sutherland.png',
      'title': 'Welcome!\nYour Culinary Adventure Begins Here 🍽️✨',
    },
    {
      'image': 'assets/images/sausage-cheese-pizza-slice.png',
      'title': 'Savor Every Moment With Our Curated Food Delight 🍽️✨',
    },
    {
      'image': 'assets/images/sushi.png',
      'title': 'Welcome! Your Culinary Adventure Begins Here 🍽️✨',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Enable_NFC.png',
              fit: BoxFit.fill,
            ),
          ),
          // Carousel Slider and Indicator
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index, realIndex) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08),
                            Image.asset(
                              onboardingData[index]['image']!,
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: SizedBox(
                                height: 280.h,
                                width: 430.w,
                                child: Text(
                                  textScaler: TextScaler.noScaling,
                                  onboardingData[index]['title']!,
                                  style: GoogleFonts.inter(
                                    letterSpacing: -0.70,
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textColor,
                                    height: 1.18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        height: MediaQuery.of(context).size.height * 4,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    // Static Carousel Indicator
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.33,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: onboardingData.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                _carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 8.0.w,
                              height: 8.0.h,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.white
                                        : AppColors.primaryColor)
                                    .withOpacity(
                                        _currentIndex == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ActionButton(
                    text: 'Get Started',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OptionBridge()));
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ],
      ),
    );
  }
}

//
// SizedBox(width: 10.w),
// GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (c) => const AddNewProduct(),
// ));
// },
// child: Container(
// width: 83.w,
// height: 52.h,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8),
// border: Border.all(
// width: 1,
// color: AppColors.borderColor,
// ),
// ),
// child: const Icon(Icons.add_circle_outline_rounded,
// color: AppColors.iconColor)),
// ),
