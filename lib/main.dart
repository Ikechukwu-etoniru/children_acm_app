import 'package:acm_diocese_of_calabar/screen/teaching_aid_screen.dart';
import 'package:acm_diocese_of_calabar/screen/training_screen.dart';
import 'package:flutter/material.dart';
import '/screen/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACM',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Lato'),
      home: DashboardScreen(),
      routes: {
        TrainingScreen.routeName: (ctx) => TrainingScreen(),
        TeachingAidScreen.routeName: (ctx) => TeachingAidScreen()
      },
    );
  }
}
