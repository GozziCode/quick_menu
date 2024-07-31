
import 'package:flutter/material.dart';
import 'package:quick_menu/constant/app_color.dart';

import '../../models/menu_model.dart';
import '../../services/nfc_service.dart';

class WritingScreen extends StatefulWidget {
  final Menu menu;

  const WritingScreen({super.key, required this.menu});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  Future<void> _readingNfc() async {
    try {
      await writeMenuToNfc(widget.menu).then((onValue) {
        debugPrint("Status");
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Center(
                child: Text(onValue),
              );
            });
        Navigator.pop(context);
      });
    } catch (e) {

       Navigator.push(
        context.mounted? context: context,
        MaterialPageRoute(
          builder: (context) => const SizedBox(),
        ),
      );
      debugPrint('Error reading NFC: $e');
     
    }
  }

  @override
  void initState() {
    _readingNfc();
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
              child: Image.asset("assets/images/read.png"),
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