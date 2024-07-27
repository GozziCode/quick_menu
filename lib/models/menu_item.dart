
class MenuItem {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  bool isAvailable;

  MenuItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    this.isAvailable = true,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'imageUrl': imageUrl,
    'description': description,
    'price': price,
    'isAvailable': isAvailable,
  };

  static MenuItem fromJson(Map<String, dynamic> json) => MenuItem(
    name: json['name'],
    imageUrl: json['imageUrl'],
    description: json['description'],
    price: json['price'],
    isAvailable: json['isAvailable'],
  );
}
