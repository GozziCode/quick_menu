import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/app_color.dart';

class EditForm extends StatelessWidget {
  const EditForm({
    super.key,
    required this.productName,
    required this.category,
    required this.description,
    required this.price,
  });

  final TextEditingController productName;
  final TextEditingController category;
  final TextEditingController description;
  final TextEditingController price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h),
        Text(
          'Product Name',
          style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 48.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: productName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
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
        DropdownButtonFormField(
          items: [
            "Appetizers",
            "Main Course",
            "Salad & Soup",
            "Desserts",
            "Drinks"
          ].map((String category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (newValue) {
            category.text = newValue!;
          },
          dropdownColor: AppColors.white,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 48.h),
            contentPadding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
            focusColor: AppColors.lightGrey,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.lightGrey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.lightGrey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.lightGrey)),
            fillColor: Colors.white,
            hintText: category.text,
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
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: description,
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
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
        Container(
          height: 48.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: price,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                  height: 48.h,
                  width: 60.w,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'USD',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    )),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
