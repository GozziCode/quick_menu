// lib/admin_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../providers/menu_provider.dart';
import '../services/nfc_service.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool _isAvailable = true;
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Menu Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: const Text('Available'),
              value: _isAvailable,
              onChanged: (bool value) {
                setState(() {
                  _isAvailable = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                final newItem = MenuItem(
                  name: _nameController.text,
                  imageUrl: _imageUrlController.text,
                  description: _descriptionController.text,
                  price: double.parse(_priceController.text),
                  isAvailable: _isAvailable,
                );
                menuProvider.addItem(newItem);
                _nameController.clear();
                _imageUrlController.clear();
                _descriptionController.clear();
                _priceController.clear();
                setState(() {
                  _isAvailable = true;
                });
              },
              child: const Text('Add Menu Item'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await NfcService.writeNfc(context, menuProvider.menuItems);
              },
              child: const Text('Write to NFC Tag'),
            ),
          ],
        ),
      ),
    );
  }
}

