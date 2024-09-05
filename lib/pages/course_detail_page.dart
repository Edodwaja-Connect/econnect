import 'package:eapp/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(course.imageUrl),
            Text(
              course.title,
            ),
            Text(course.duration),
            Text(course.description),
            Text("Price: ${course.price} USD"),
            ElevatedButton(
              onPressed: () {
                // Implementation to add to cart
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
