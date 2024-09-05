import 'package:eapp/provider/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminApprovalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final pendingCourses = courseProvider.pendingCourses;

    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Course Approval"),
      ),
      body: ListView.builder(
        itemCount: pendingCourses.length,
        itemBuilder: (context, index) {
          final course = pendingCourses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: Text(course.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.check, color: Colors.green),
                  onPressed: () {
                    courseProvider.approveCourse(course.id);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    courseProvider.rejectCourse(course.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
