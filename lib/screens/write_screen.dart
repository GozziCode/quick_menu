// lib/admin_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../providers/menu_provider.dart';
import '../services/nfc_service.dart';


class WriteScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  WriteScreen({super.key});

  void addItem(BuildContext context) {
    final String name = nameController.text;
    final String imageUrl = imageController.text;
    final String description = descriptionController.text;
    final double price = double.parse(priceController.text);
    final newItem = MenuItem(
        name: name, imageUrl: imageUrl, description: description, price: price);
    Provider.of<MenuProvider>(context, listen: false).addItem(newItem);
    nameController.clear();
    imageController.clear();
    descriptionController.clear();
    priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: imageController,
                decoration: const InputDecoration(labelText: 'Image URL')),
            TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
            TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => addItem(context),
              child: const Text('Add Menu Item'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => NfcService.writeNfc(menuProvider.menuItems),
              child: const Text('Write to NFC Tag'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuProvider.menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuProvider.menuItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    trailing: Switch(
                      value: item.isAvailable,
                      onChanged: (value) {
                        menuProvider.toggleAvailability(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
