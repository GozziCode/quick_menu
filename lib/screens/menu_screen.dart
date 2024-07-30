import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_menu/constant/app_color.dart';
import 'package:quick_menu/providers/menu_provider.dart';
=======
import 'package:quick_menu/constant/app_color.dart';
import 'package:quick_menu/screens/option_bridge.dart';
>>>>>>> 119b048260cad1ebea17cc76f8b84dc4518fb4ba

import '../models/menu_model.dart';

class MenuScreen extends StatelessWidget {
  final Menu menu;

  const MenuScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu List"),
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: Colors.transparent,
=======
    return PopScope(
      onPopInvoked: (canPop) {
        print(canPop);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OptionBridge(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menu List"),
          backgroundColor: AppColors.bgColor,
          surfaceTintColor: Colors.transparent,
        ),
        body: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              String categoryName = menu.categories[index];
              List<MenuModel>? categoryItems = menu.map[categoryName];
              return _MenuCategory(
                  categoryList: categoryItems!, category: categoryName);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                child: Divider(),
              );
            },
            itemCount: menu.categories.length),
>>>>>>> 119b048260cad1ebea17cc76f8b84dc4518fb4ba
      ),
    );
  }
}

class _MenuCategory extends StatelessWidget {
  final List<MenuModel> categoryList;
  final String category;

  const _MenuCategory({required this.categoryList, required this.category});

  @override
  Widget build(BuildContext context) {
    MenuProvider menuProvider = Provider.of<MenuProvider>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
<<<<<<< HEAD
              children: List.generate(menuProvider.menuItems.length, (index) {
                return const MenuItem();
=======
              children: List.generate(categoryList.length, (index) {
                MenuModel item = categoryList[index];
                return _MenuItem(
                  menuModel: item,
                );
>>>>>>> 119b048260cad1ebea17cc76f8b84dc4518fb4ba
              }),
            ),
          ],
        ));
  }
}

class _MenuItem extends StatelessWidget {
  final MenuModel menuModel;

  const _MenuItem({required this.menuModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  menuModel.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                menuModel.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "\$${menuModel.price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        // GestureDetector(
        //     // onTap: () => _showBottomSheet(context),
        //     child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SvgPicture.asset(
        //     'assets/svgs/edit.svg',
        //   ),
        // ))
      ],
    );
  }
}
