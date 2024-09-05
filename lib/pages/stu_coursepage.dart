import 'package:eapp/pages/course_detail_page.dart';
import 'package:eapp/provider/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final courses = courseProvider.courses;

    return Scaffold(
      appBar: AppBar(
        title: Text("Available Courses"),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text("${course.price} USD"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourseDetailPage(course: course)),
              );
            },
          );
        },
      ),
    );
  }
}
