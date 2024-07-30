import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyALertDialog extends StatelessWidget {
  const MyALertDialog({super.key});

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0.r),
            child: SizedBox(
              height: 306.h,
              width: 352.w,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    // left: 304.w,
                    top: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 147.h,
                      width: 283.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset('assets/successicon.png'),
                          ),
                          Container(
                            height: 53.h,
                            width: 283.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Successful',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF424242),
                                    fontSize: 20.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.5.h,
                                  ),
                                ),
                                Text(
                                  'Product has been recorded successfully',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF424242),
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSuccessDialog(context),
          child: Text('Add'),
        ),
      ),
    );
  }
}
