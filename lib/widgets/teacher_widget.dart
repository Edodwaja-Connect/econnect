import 'package:eapp/models/teachers_model.dart';
import 'package:eapp/styles/styles.dart';
import 'package:flutter/material.dart';

class TeacherWidget extends StatefulWidget {
  const TeacherWidget({super.key});

  @override
  State<TeacherWidget> createState() => _TeacherWidgetState();
}

class _TeacherWidgetState extends State<TeacherWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final Teacher = teachers[index];
          return ListTile(
            leading: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  backgroundImage: AssetImage(Teacher.url),
                ),
                Text(
                  Teacher.username,
                  style: BoldText.nameOfTextStyle,
                )
              ],
            ),
          );
        });
  }
}
