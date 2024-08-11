import 'package:flutter/material.dart';

class Course {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Course({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

class Shop extends ChangeNotifier {
  //product for sale
  final List<Course> _shop = [
    //product 1
    Course(
        name: "Kranthi",
        price: 130000,
        description: "Flutter developer",
        imagePath: 'assets/images/teachers/kranthi.webp'),

    //product 2
    Course(
        name: "Shreya",
        price: 90,
        description: "Cloud Developer",
        imagePath: 'assets/images/teachers/papa.webp'),

    //product 3
    Course(
        name: "Madulash",
        price: 2000.79,
        description: "Robotics",
        imagePath: 'assets/images/teachers/har.webp'),

    //product 4
    Course(
        name: "Surabhi",
        price: 9000.97,
        description: "Web developer",
        imagePath: 'assets/images/teachers/harshi.webp'),
  ];

  //user cart
  List<Course> _cart = [];

  //get product list
  List<Course> get shop => _shop;

  //get user cart
  List<Course> get cart => _cart;

  //add item to cart
  void addToCart(Course item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Course item) {
    _cart.remove(item);
  }
}
