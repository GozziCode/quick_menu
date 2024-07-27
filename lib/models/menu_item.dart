// lib/menu_item.dart
class MenuItem {
  String name;
  String imageUrl; // URL to the image
  String description;
  double price;
  bool isAvailable;

  MenuItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.isAvailable,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'].toDouble(),
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
    };
  }
}
