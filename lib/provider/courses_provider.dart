import 'package:flutter/material.dart';

import '/models/courses.dart';

class CoursesProvider with ChangeNotifier {
  final List<Courses> _courseList = [];

  List<Courses> get courseList {
    return [..._courseList];
  }

  
}
