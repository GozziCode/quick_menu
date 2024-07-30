import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_menu/constant/app_color.dart';
import 'package:quick_menu/screens/option_bridge.dart';

import '../models/menu_model.dart';

class MenuScreen extends StatelessWidget {
  final Menu menu;

  const MenuScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}

class _MenuCategory extends StatelessWidget {
  final List<MenuModel> categoryList;
  final String category;

  const _MenuCategory(
      {super.key, required this.categoryList, required this.category});

  @override
  Widget build(BuildContext context) {
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
              children: List.generate(categoryList.length, (index) {
                MenuModel item = categoryList[index];
                return _MenuItem(
                  menuModel: item,
                );
              }),
            ),
          ],
        ));
  }
}

class _MenuItem extends StatelessWidget {
  final MenuModel menuModel;

  const _MenuItem({super.key, required this.menuModel});

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "\$${menuModel.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
            // onTap: () => _showBottomSheet(context),
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/svgs/edit.svg',
          ),
        ))
      ],
    );
  }
}
//
//
// void _showBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     backgroundColor: AppColors.bgColor,
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return DraggableScrollableSheet(
//         minChildSize: 0.5,
//         maxChildSize: 0.8,
//         initialChildSize: 0.7,
//         expand: false,
//         builder: (_, controller) {
//           return EditBottomSheet();
//         },
//       );
//     },
//   );
// }
