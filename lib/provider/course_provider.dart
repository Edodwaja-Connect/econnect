import 'package:eapp/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseProvider with ChangeNotifier {
  final List<Course> _courses = [];

  List<Course> get courses =>
      _courses.where((course) => course.isApproved).toList();
  List<Course> get pendingCourses =>
      _courses.where((course) => !course.isApproved).toList();

  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }

  void approveCourse(String courseId) {
    _courses.firstWhere((course) => course.id == courseId).isApproved = true;
    notifyListeners();
  }

  void rejectCourse(String courseId) {
    _courses.removeWhere((course) => course.id == courseId);
    notifyListeners();
  }

  void editCourse(Course updatedCourse) {
    var index = _courses.indexWhere((course) => course.id == updatedCourse.id);
    if (index != -1) {
      _courses[index] = updatedCourse;
      notifyListeners();
    }
  }
}
