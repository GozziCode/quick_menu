import 'package:equatable/equatable.dart';

class MenuModel extends Equatable {
  final String name;
  final String description;
  final double price;
  final String category;

  const MenuModel({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  });

  @override
  List<Object?> get props => [name, description, price, category];

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

class Menu extends Equatable {
  final String title;
  final Map<String, List<MenuModel>> map;
  final List<String> categories;
  final DateTime dateTime;

  const Menu(
      {required this.map,
      required this.categories,
      required this.dateTime,
      required this.title});

  @override
  List<Object?> get props => [title, map, categories, dateTime];

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

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      title: json['title'],
      map: (json['map'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List<dynamic>)
              .map((item) => MenuModel.fromJson(item))
              .toList(),
        ),
      ),
      categories: List<String>.from(json['categories']),
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'map': map.map(
        (key, value) => MapEntry(
          key,
          value.map((item) => item.toJson()).toList(),
        ),
      ),
      'categories': categories,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
