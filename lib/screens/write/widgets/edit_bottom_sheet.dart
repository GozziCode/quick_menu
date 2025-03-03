// edit_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_color.dart';
import '../../../models/menu_model.dart';

import '../bloc/model/menu_bloc.dart';
import '../bloc/model/menu_event.dart';
import 'edit_form.dart';

class EditBottomSheet extends StatelessWidget {
  final MenuModel menuModel;
  final String menuTitle;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  EditBottomSheet(
      {super.key, required this.menuModel, required this.menuTitle});

  @override
  Widget build(BuildContext context) {
    priceController.text = menuModel.price.toString();
    categoryController.text = menuModel.category;
    productNameController.text = menuModel.name;
    descriptionController.text = menuModel.description;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 23.0.w,
              left: 23.0.w,
              top: 23.0.w,
            ),
            child: Column(
              children: [
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
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
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
                    onTap: () {
                      MenuModel newMenuModel = MenuModel(
                          name: productNameController.text,
                          description: descriptionController.text,
                          price: double.parse(priceController.text),
                          category: categoryController.text);
                      context.read<MenuModelBloc>().add(EditMenuItem(
                          menuModel, newMenuModel, menuModel.category));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 384.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Save Changes',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            height: (19.36 / 16).h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<MenuModelBloc>()
                          .add(RemoveMenuItem(menuModel, menuModel.category));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 384.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Delete Product',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            height: (19.36 / 16).h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
