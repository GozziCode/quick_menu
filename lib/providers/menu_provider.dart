import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class MenuProvider with ChangeNotifier {
  List<MenuModel> _MenuModels = [];

  List<MenuModel> get MenuModels => _MenuModels;

  void setMenuModels(List<MenuModel> items) {
    _MenuModels = items;
    notifyListeners();
  }

  // void toggleAvailability(String id) {
  //   var index = _MenuModels.indexWhere((item) => item.id == id);
  //   if (index != -1) {
  //     _MenuModels[index].isAvailable = !_MenuModels[index].isAvailable;
  //     notifyListeners();
  //   }
  // }

  void addItem(MenuModel item) {
    _MenuModels.add(item);
    notifyListeners();
  }

  // void updateMenuModelAvailability(String id, bool isAvailable) {
  //   var index = _MenuModels.indexWhere((item) => item.id == id);
  //   if (index != -1) {
  //     _MenuModels[index].isAvailable = isAvailable;
  //     notifyListeners();
  //   }
  // }

  void editMenuModel(String id, MenuModel newItem) {
    var index = _MenuModels.indexWhere((item) => item == id);
    if (index != -1) {
      _MenuModels[index] = newItem;
      notifyListeners();
    }
  }

  void deleteMenuModel(String id) {
    _MenuModels.removeWhere((item) => item == id);
    notifyListeners();
  }

  Map<String, List<MenuModel>> get MenuModelsByCategory {
    Map<String, List<MenuModel>> itemsByCategory = {};
    for (var item in _MenuModels) {
      if (!itemsByCategory.containsKey(item.category)) {
        itemsByCategory[item.category] = [];
      }
      itemsByCategory[item.category]!.add(item);
    }
    return itemsByCategory;
  }
}
