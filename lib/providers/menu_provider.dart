
import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];

  List<MenuItem> get menuItems => _menuItems;

  void setMenuItems(List<MenuItem> items) {
    _menuItems = items;
    notifyListeners();
  }

  void toggleAvailability(String id) {
    var index = _menuItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _menuItems[index].isAvailable = !_menuItems[index].isAvailable;
      notifyListeners();
    }
  }

  void addItem(MenuItem item) {
    _menuItems.add(item);
    notifyListeners();
  }

  void updateMenuItemAvailability(String id, bool isAvailable) {
    var index = _menuItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _menuItems[index].isAvailable = isAvailable;
      notifyListeners();
    }
  }

  void editMenuItem(String id, MenuItem newItem) {
    var index = _menuItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _menuItems[index] = newItem;
      notifyListeners();
    }
  }

  void deleteMenuItem(String id) {
    _menuItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  Map<String, List<MenuItem>> get menuItemsByCategory {
    Map<String, List<MenuItem>> itemsByCategory = {};
    for (var item in _menuItems) {
      if (!itemsByCategory.containsKey(item.category)) {
        itemsByCategory[item.category] = [];
      }
      itemsByCategory[item.category]!.add(item);
    }
    return itemsByCategory;
  }
}
