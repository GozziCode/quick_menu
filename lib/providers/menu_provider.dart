import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class MenuProvider with ChangeNotifier {
  List<Menu> menus = [];

  void addMenu(Menu item) {
    menus.add(item);
    print(item.title);
    print(menus.length);
    notifyListeners();
  }

  Menu getMenu(int index) {
    return menus[index];
  }

  void deleteMenu(String title) {
    menus.removeWhere((menu) => menu.title == title);
    notifyListeners();
  }

  void editMenuModel(String menuTitle, MenuModel editModel, String category) {
    int index = menus.indexWhere((menu) => menu.title == menuTitle);
    if (index != -1) {
      Menu target = menus[index];
      int? modelIndex = target.map[category]
          ?.indexWhere((model) => model.name == editModel.name);

      if (index != -1) {
        target.map[category]?[modelIndex!] = editModel;
      } else {
        target.map[category]?.add(editModel);
      }
      notifyListeners();
    }
  }

  void removeMenuModel(
      String menuTitle, MenuModel removeModel, String category) {
    int index = menus.indexWhere((menu) => menu.title == menuTitle);
    if (index != -1) {
      Menu target = menus[index];
      int? modelIndex = target.map[category]
          ?.indexWhere((model) => model.name == removeModel.name);

      if (index != -1) {
        target.map[category]
            ?.removeWhere((menu) => menu.name == removeModel.name);
      }
      if (target.map[category]!.isEmpty) {
        target.categories
            .removeWhere((category) => category == removeModel.category);
      }
      notifyListeners();
    }
  }

// Map<String, List<MenuModel>> get MenuModelsByCategory {
//   Map<String, List<MenuModel>> itemsByCategory = {};
//   for (var item in _MenuModels) {
//     if (!itemsByCategory.containsKey(item.category)) {
//       itemsByCategory[item.category] = [];
//     }
//     itemsByCategory[item.category]!.add(item);
//   }
//   return itemsByCategory;
// }
}
