import 'package:flutter/material.dart';
import 'package:quick_menu/constant/app_color.dart';

import '../../models/menu_model.dart';
import '../../services/nfc_service.dart';
import '../alert_box.dart';

class WritingScreen extends StatefulWidget {
  final Menu menu;

  const WritingScreen({super.key, required this.menu});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  Future<void> _writingNfc() async {
    try {
      String status = await writeMenuToNfc(widget.menu, context);

      if (mounted && status == "MenuItem written successfully to NFC tag") {
        showDialog(
          context: context,
          builder: (context) => const AlertBox(
              title: 'Success',
              img: 'assets/images/success.png',
              message: 'MenuItem written successfully to NFC tag.'),
        );
      }
      if (status == "not available" && mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertBox(
              title: 'Enable NFC',
              img: 'assets/images/fail.png',
              message: 'You need NFC enable to write to a tag'),
        );
      }
    } catch (e) {
      debugPrint('Error reading NFC: $e');

      showDialog(
        context: context.mounted ? context : context,
        builder: (context) => const AlertBox(
            title: 'Error',
            img: 'assets/images/fail.png',
            message:
                'An error occurred while reading the NFC tag. Please try again.'),
      );
    }
  }

  @override
  void initState() {
    _writingNfc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset("assets/images/searching.png"),
            ),
            const Text(
              "Searching for Tags",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 36.0),
              child: Text(
                "Keep your phone close to the tag",
                style: TextStyle(color: AppColors.textColor, fontSize: 18.0),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12.0)),
                      side: WidgetStateProperty.all(
                          const BorderSide(color: AppColors.textColor))),
                  child: const Text(
                    "Cancel",
                    style:
                        TextStyle(color: AppColors.textColor, fontSize: 18.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
