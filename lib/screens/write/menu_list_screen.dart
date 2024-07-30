import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quick_menu/constant/app_color.dart';
import 'package:quick_menu/screens/read/searching_screen.dart';
import 'package:quick_menu/screens/write/WritingScreen.dart';
import 'package:quick_menu/screens/write/edit_collection_screen.dart';
import 'package:quick_menu/screens/write/widgets/create_menu_sheet.dart';

import '../../models/menu_model.dart';
import 'bloc/menu_bloc.dart';
import 'bloc/menu_state.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Menu Edits"),
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.delete))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showCreateBottomSheet(context);
            },
            backgroundColor: AppColors.primaryColor,
            shape: OvalBorder(),
            child: const Icon(
              CupertinoIcons.add,
              color: AppColors.white,
              size: 32.0,
            ),
          ),
          body: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 24.0, top: 12.0, bottom: 8.0),
                        child: Text(
                          "Select one to write to NFC",
                          style: TextStyle(
                              fontSize: 20.0, color: AppColors.lightGrey),
                        ),
                      ),
                      MenuCollection(index: index, menu: state.menus[index])
                    ],
                  );
                }
                return MenuCollection(index: index, menu: state.menus[index]);
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12.0),
                  child: Divider(),
                );
              },
              itemCount: state.menus.length),
        );
      },
    );
  }
}

class MenuCollection extends StatelessWidget {
  final int index;
  final Menu menu;

  const MenuCollection({super.key, required this.index, required this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WritingScreen(menu: menu)));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.0),
                          child: Text(
                            menu.title,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Chip(
                              label:
                                  Text("+${menu.categories.length} categories"),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              labelPadding: EdgeInsets.all(0.0),
                              color: WidgetStateProperty.all(AppColors.white),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Chip(
                              label: Text(
                                  "${menu.dateTime.day}/${menu.dateTime.month < 10 ? "0${menu.dateTime.month}" : menu.dateTime.month}/${menu.dateTime.year}"),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              labelPadding: EdgeInsets.all(0.0),
                              color: WidgetStateProperty.all(AppColors.white),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCollectionScreen(
                                    index: index,
                                  ))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/svgs/edit.svg',
                          width: 30.0,
                          color: AppColors.primaryColor,
                        ),
                      ))
                ],
              ),
            )));
  }
}

void _showCreateBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppColors.bgColor,
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        minChildSize: 0.5,
        maxChildSize: 0.9,
        initialChildSize: 0.7,
        snap: true,
        expand: false,
        builder: (_, controller) {
          return CreateMenuBottomSheet();
        },
      );
    },
  );
}
