import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_menu/constant/app_color.dart';

import '../../../components/action_button.dart';
import '../../../models/menu_item.dart';
import '../../../providers/menu_provider.dart';
import '../../../services/nfc_service.dart';
import '../../alert_box.dart';

import 'widgets/edit_form.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertBox(
          title: 'Successful',
          img: 'assets/images/success.png',
          message: 'Product has been recorded successfully',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add New Product',
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
                  SizedBox(
                    height: 80.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ActionButton(
                        onTap: () async {
                          final newItem = MenuItem(
                            id: "0",
                            name: productNameController.text,
                            description: descriptionController.text,
                            price: double.parse(priceController.text),
                            category: 'Spicy',
                          );
                          menuProvider.addItem(newItem);

                          await writeMenuToNfc(newItem);
                          // _nameController.clear();
                          // _imageUrlController.clear();
                          // _descriptionController.clear();
                          // _priceController.clear();
                          // await NfcService.writeNfc(
                          //     context, menuProvider.menuItems);

                          // if (mounted) {
                          //   _showSuccessDialog(context);
                          // }
                        },
                        // () => _showBottomSheet(context),
                        text: 'Write to NFC'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ActionButton(
                        onTap: () async {
                          await readMenuFromNfc();
                        },
                        // () => _showBottomSheet(context),
                        text: 'Read from NFC'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // lib/admin_view.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/menu_item.dart';
// import '../providers/menu_provider.dart';
// import '../services/nfc_service.dart';

// class WriteScreen extends StatefulWidget {
//   const WriteScreen({super.key});

//   @override
//   State<WriteScreen> createState() => _WriteScreenState();
// }

// class _WriteScreenState extends State<WriteScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _imageUrlController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   bool _isAvailable = true;
//   @override
//   Widget build(BuildContext context) {
//     final menuProvider = Provider.of<MenuProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Menu Management'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _imageUrlController,
//               decoration: const InputDecoration(labelText: 'Image URL'),
//             ),
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//             TextField(
//               controller: _priceController,
//               decoration: const InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//             ),
//             SwitchListTile(
//               title: const Text('Available'),
//               value: _isAvailable,
//               onChanged: (bool value) {
//                 setState(() {
//                   _isAvailable = value;
//                 });
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final newItem = MenuItem(
//                   name: _nameController.text,
//                   imageUrl: _imageUrlController.text,
//                   description: _descriptionController.text,
//                   price: double.parse(_priceController.text),
//                   isAvailable: _isAvailable,
//                 );
//                 menuProvider.addItem(newItem);
//                 _nameController.clear();
//                 _imageUrlController.clear();
//                 _descriptionController.clear();
//                 _priceController.clear();
//                 setState(() {
//                   _isAvailable = true;
//                 });
//               },
//               child: const Text('Add Menu Item'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await NfcService.writeNfc(context, menuProvider.menuItems);
//               },
//               child: const Text('Write to NFC Tag'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
