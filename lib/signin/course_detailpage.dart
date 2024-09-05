import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseDetailsPage extends StatelessWidget {
  final QueryDocumentSnapshot course;

  CourseDetailsPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${course['tutorName']} - Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(course['profileImageUrl']),
              ),
            ),
            SizedBox(height: 20),
            Text('Tutor Name: ${course['tutorName']}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Subject: ${course['tutorSubject']}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Price: \$${course['coursePrice']}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Duration: ${course['duration']}',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
