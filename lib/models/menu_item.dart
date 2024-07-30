class MenuItem {
  String id;
  String name;
  String imageUrl; // URL to the image
  String description;
  double price;
  bool isAvailable;
  String category;

  MenuItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.category,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'].toDouble(),
      isAvailable: json['isAvailable'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
      'category': category,
    };
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? '').toDouble(),
      isAvailable: json['isAvailable'] ?? false,
    );
  }
}
