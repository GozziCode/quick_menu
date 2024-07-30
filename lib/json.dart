import 'models/menu_model.dart';

var jsonData = {
  "title": "Sunday's Cals",
  "map": {
    "Drinks": [
      MenuModel(
          name: "name",
          description: "description",
          price: 23.0,
          category: "Drinks"),
      MenuModel(
          name: "name",
          description: "description",
          price: 23.0,
          category: "Drinks"),
    ]
  },
  "category": ["Drinks", "appetizers"],
  "dateTime": DateTime.now(),
};
