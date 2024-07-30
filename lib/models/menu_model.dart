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
  String title;
  Map<String, List<MenuModel>> map;
  List<String> categories;
  DateTime dateTime;

  Menu(
      {required this.map,
      required this.categories,
      required this.dateTime,
      required this.title});

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

    return Menu(
        title: "Sunday's Special",
        map: menuMap,
        categories: menuCategories,
        dateTime: DateTime.now());
  }
}
