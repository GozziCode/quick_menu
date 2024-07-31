

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_menu/screens/write/bloc/list/menu_event.dart';
import 'package:quick_menu/screens/write/bloc/model/menu_bloc.dart';
import 'package:quick_menu/screens/write/bloc/model/menu_state.dart';
import 'package:quick_menu/screens/write/widgets/add_bottom_sheet.dart';
import 'package:quick_menu/screens/write/widgets/edit_bottom_sheet.dart';

import '../../constant/app_color.dart';
import '../../models/menu_model.dart';
import 'bloc/list/menu_bloc.dart';

class EditCollectionScreen extends StatelessWidget {
  final Menu menu;

  const EditCollectionScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuModelBloc, MenuModelState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            state.menu.title,
            style:  const TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  context.read<MenuListBloc>().add(DeleteMenu(menu));

                  Navigator.pop(context);
                },
                icon: const Icon(
                  CupertinoIcons.delete,
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: AppColors.bgColor,
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (BuildContext _) {
                return DraggableScrollableSheet(
                  minChildSize: 0.5,
                  maxChildSize: 0.9,
                  initialChildSize: 0.8,
                  snap: true,
                  expand: false,
                  builder: (_, controller) {
                    return BlocProvider.value(
                      value: BlocProvider.of<MenuModelBloc>(context),
                      child: AddBottomSheet(
                        menuTitle: state.menu.title,
                      ),
                    );
                  },
                );
              },
            );
          },
          backgroundColor: AppColors.primaryColor,
          shape: const OvalBorder(),
          child: const Icon(
            CupertinoIcons.add,
            color: AppColors.white,
            size: 32.0,
          ),
        ),
        body: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              String categoryName = state.menu.categories[index];
              List<MenuModel>? categoryItems = state.menu.map[categoryName];
              return _MenuCategory(
                categoryList: categoryItems!,
                category: categoryName,
                title: state.menu.title,
              );
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                child: Divider(),
              );
            },
            itemCount: state.menu.categories.length),
      );
    });
  }
}

class _MenuCategory extends StatelessWidget {
  final List<MenuModel> categoryList;
  final String category;
  final String title;

  const _MenuCategory(
      {required this.categoryList,
      required this.category,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
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
                  title: title,
                );
              }),
            ),
          ],
        ));
  }
}

class _MenuItem extends StatelessWidget {
  final MenuModel menuModel;
  final String title;

  const _MenuItem({required this.menuModel, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuModelBloc, MenuModelState>(
        builder: (context, state) {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    menuModel.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  menuModel.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "\$${menuModel.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.bgColor,
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (BuildContext _) {
                    return DraggableScrollableSheet(
                      minChildSize: 0.5,
                      maxChildSize: 0.9,
                      initialChildSize: 0.83,
                      snap: true,
                      expand: false,
                      builder: (_, controller) {
                        return BlocProvider.value(
                          value: BlocProvider.of<MenuModelBloc>(context),
                          child: EditBottomSheet(
                            menuModel: menuModel,
                            menuTitle: title,
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/svgs/edit.svg',
                ),
              ),)
        ],
      );
    });
  }
}
