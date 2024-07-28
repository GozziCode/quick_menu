// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quick_menu/screens/enable_nfc_screen.dart';

// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../screens/tap_nfc_screen.dart';
// import '../screens/read_write_screen.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   PageController _controller = PageController();

//   bool onPage3 = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         PageView(
//           controller: _controller,
//           onPageChanged: (index) {
//             setState(() {
//               onPage3 = (index == 2);
//             });
//           },
//           children: const [
//             EnableNfcScreen(),
//             TapNfcScreen(),
//             ReadandWriteNfc(),
//           ],
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 30.h,
//           child: Column(
//             children: [
//               Text('Back'),
//               SizedBox(height: 32.h),
//               SmoothPageIndicator(
//                 controller: _controller,
//                 count: 3,
//                 onDotClicked: (index) => _controller.animateToPage(index,
//                     duration: const Duration(microseconds: 600),
//                     curve: Curves.easeIn),
//                 effect:  WormEffect(
//                   dotHeight: 8.h,
//                   dotWidth: 8.w,
//                   activeDotColor: Color.fromRGBO(252, 171, 16, 1),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ));
//   }
// }
