import 'package:flutter/material.dart';
import '../product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(id: 'abc1111', title: 'Test1', contents: 'This is for test'),
    Product(id: 'abc2222', title: 'Issac', contents: 'Bity Naughty Cat'),
    Product(id: 'abc3333', title: 'Drink', contents: 'It is getting cold'),
    Product(id: 'abc4444', title: 'Strawberry', contents: 'When I find myself'),
    Product(id: 'abc5555', title: 'Kiwi', contents: 'Times of trouble'),
    Product(id: 'abc6666', title: 'Subway', contents: 'Vending Machine'),
    Product(id: 'abc7777', title: 'Apple', contents: 'yummy yummy'),
    Product(id: 'abc8888', title: 'Chair', contents: 'What am I doing now?'),
    Product(id: 'abc9999', title: 'Chocolate', contents: 'Dark, Milk, White'),
    Product(id: 'abc0000', title: 'Citron', contents: 'He doesnt like it'),
    Product(id: 'abc0001', title: 'Table', contents: 'I bet.'),
    Product(id: 'abc0002', title: 'Coffee', contents: 'Starbuck loves it!'),
  ];

  List<Product> get items {
    return [..._items];
  }

  // better to call http request here
  // if you need to fetch data, call method by initState() or build() then the provider method will be called.
  void addProduct(Product val) {
    _items.add(val);
    notifyListeners();
  }
}
