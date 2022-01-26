import 'package:acm_diocese_of_calabar/provider/courses_provider.dart';
import 'package:acm_diocese_of_calabar/training_components/screens/training_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'teaching_aid_components/screen/teaching_aid_screen.dart';
import 'training_components/screens/training_screen.dart';
import 'dashboard_components/screens/dashboard_screen.dart';
import '/provider/songs_provider.dart';
import '/provider/story_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SongProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CoursesProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ACM',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
        home: DashboardScreen(),
        routes: {
          TrainingScreen.routeName: (ctx) => TrainingScreen(),
          TeachingAidScreen.routeName: (ctx) => TeachingAidScreen(),
          TrainingCoursesScreen.routeName: (ctx) =>
              const TrainingCoursesScreen()
        },
      ),
    );
  }
}
