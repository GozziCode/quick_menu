import 'models/menu_model.dart';

var jsonData = {
  "title": "Sunday's Cals",
  "map": {
    "Drinks": [
      const MenuModel(
          name: "name",
          description: "description",
          price: 23.0,
          category: "Drinks"),
      const MenuModel(
          name: "name",
          description: "description",
          price: 23.0,
          category: "Drinks"),
    ]
  },
  "category": ["Drinks", "appetizers"],
  "dateTime": DateTime.now(),
};
