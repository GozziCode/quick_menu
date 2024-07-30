// edit_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/app_color.dart';

class EditBottomSheet extends StatelessWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

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
                EditForm(
                    productName: productNameController,
                    category: categoryController,
                    description: descriptionController,
                    price: priceController),
                SizedBox(height: 30.h),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 384.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          top: BorderSide(
                            width: 1.0.w,
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Save Changes',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                            height: (19.36 / 16).h,
                          ),
                        ),
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
        SizedBox(height: 25.h),
        Text(
          'Product Name',
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
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: category,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
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
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: category,
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
