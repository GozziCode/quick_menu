import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_menu/constant/app_color.dart';

import 'write/widgets/widgets/edit_bottom_sheet.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return const MenuCategory();
          },
          separatorBuilder: (context, int) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
              child: Divider(),
            );
          },
          itemCount: 3),
    );
  }
}

class MenuCategory extends StatelessWidget {
  const MenuCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Appetiser",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(3, (index) {
                return const MenuItem();
              }),
            ),
          ],
        ));
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.bgColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          minChildSize: 0.5,
          maxChildSize: 0.8,
          initialChildSize: 0.7,
          expand: false,
          builder: (_, controller) {
            return EditBottomSheet();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  "Cripsy Fried Chicken",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Crispy fried chicken is marinated, coated in a seasoned batter, and deep-fried",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "\$3.50",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: SvgPicture.asset(
              'assets/svgs/edit.svg',
            ))
      ],
    );
  }
}
