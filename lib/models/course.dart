import 'package:flutter/material.dart';

class Coursee {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Coursee({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

class Shop extends ChangeNotifier {
  //product for sale
  final List<Coursee> _shop = [
    //product 1
    Coursee(
        name: "Kranthi",
        price: 130000,
        description: "Flutter developer",
        imagePath: 'assets/images/teachers/kranthi.webp'),

    //product 2
    Coursee(
        name: "Shreya",
        price: 90,
        description: "Cloud Developer",
        imagePath: 'assets/images/teachers/papa.webp'),

    //product 3
    Coursee(
        name: "Madulash",
        price: 2000.79,
        description: "Robotics",
        imagePath: 'assets/images/teachers/har.webp'),

    //product 4
    Coursee(
        name: "Surabhi",
        price: 9000.97,
        description: "Web developer",
        imagePath: 'assets/images/teachers/harshi.webp'),
  ];

  //user cart
  List<Coursee> _cart = [];

  //get product list
  List<Coursee> get shop => _shop;

  //get user cart
  List<Coursee> get cart => _cart;

  //add item to cart
  void addToCart(Coursee item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Coursee item) {
    _cart.remove(item);
  }
}
