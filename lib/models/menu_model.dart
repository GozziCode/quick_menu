class MenuModel {
  final String name;
  final String description;
  final double price;
  final String category;

  MenuModel({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'category': category,
    };
  }
}

class Menu {
  Map<String, List<MenuModel>> map;
  List<String> categories;

  Menu({required this.map, required this.categories});

  factory Menu.fromList(List<MenuModel> items) {
    Map<String, List<MenuModel>> menuMap = {};
    List<String> menuCategories = [];

    for (MenuModel item in items) {
      if (menuMap[item.category] == null) {
        if (!menuCategories.contains(item.category)) {
          menuCategories.add(item.category);
        }
        menuMap[item.category] = [];
      }
      menuMap[item.category]?.add(item);
    }

    return Menu(map: menuMap, categories: menuCategories);
  }
}
