// edit_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_color.dart';

class EditBottomSheet extends StatelessWidget {
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController longTextController = TextEditingController();

  EditBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Update Product',
                      style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Text(
                  'Product Name',
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: field1Controller,
                  decoration: InputDecoration(
                    hintText: 'Kimiko Green Salad',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Product Category',
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: field2Controller,
                  decoration: InputDecoration(
                    hintText: 'Salad and Soup',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Product Description',
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: longTextController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText:
                        'Lettuce, spinach, cucumber, and avocado, often topped with a light vinaigrette',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Product Price',
                  style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: field2Controller,
                  decoration: InputDecoration(
                    suffix: const Text('USD'),
                    hintText: '10.00',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 384.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          top: BorderSide(
                            width: 1.0.w,
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Save Changes',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                              height: (19.36 / 16).h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
