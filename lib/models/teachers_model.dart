import 'package:flutter/material.dart';

class Teacher {
  final String username;
  final String url;

  const Teacher({
    required this.username,
    required this.url,
  });
}

List<Teacher> teachers = [
  Teacher(username: "Sridhar", url: "assets/images/teachers/kranthi.webp"),
  Teacher(username: "Madhulash", url: "assets/images/teachers/har.webp"),
  Teacher(username: "Harshitha", url: "assets/images/teachers/harshi.webp"),
  Teacher(username: "Varshini", url: "assets/images/teachers/papa.webp"),
];
