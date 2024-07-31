// edit_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/screens/write/bloc/list/menu_bloc.dart';

import '../../../constant/app_color.dart';

import '../../../models/menu_model.dart';
import '../bloc/list/menu_event.dart';

class CreateMenuBottomSheet extends StatelessWidget {
  CreateMenuBottomSheet({super.key});

  final _menuNameTextController = TextEditingController();

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
            padding: EdgeInsets.only(
              right: 23.0.w,
              left: 23.0.w,
              top: 23.0.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create a new Menu',
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
                SizedBox(height: 24.h),
                Text(
                  'Menu Name',
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
                    controller: _menuNameTextController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_menuNameTextController.text != "") {
                        Menu newMenu = Menu(
                            map: const {},
                            categories: const [],
                            dateTime: DateTime.now(),
                            title: _menuNameTextController.text);
                        context.read<MenuListBloc>().add(AddMenu(newMenu));

                        Navigator.pop(context);
                      }
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
                          'Create Menu',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
