import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'teaching_aid_components/screen/teaching_aid_screen.dart';
import 'teaching_aid_components/screen/teaching_aid_songs.dart';
import 'training_components/screens/training_screen.dart';
import 'dashboard_components/screens/dashboard_screen.dart';
import '/provider/songs_provider.dart';
import '/provider/story_provider.dart';
import '/provider/courses_provider.dart';
import '/training_components/screens/training_courses_screen.dart';

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
              const TrainingCoursesScreen(),
          TeachingAidSongScreen.routeName: (ctx) =>
              const TeachingAidSongScreen()
        },
      ),
    );
  }
}
