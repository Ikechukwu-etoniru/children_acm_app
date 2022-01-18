import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'teaching_aid components/screen/songs_screen.dart';
import 'teaching_aid components/screen/teaching_aid_screen.dart';
import 'training components/screens/training_screen.dart';
import 'dashboard_components/screens/dashboard_screen.dart';
import '/provider/songs_provider.dart';

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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ACM',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Lato'),
        home: DashboardScreen(),
        routes: {
          TrainingScreen.routeName: (ctx) => TrainingScreen(),
          TeachingAidScreen.routeName: (ctx) => TeachingAidScreen(),
          TeachingAidSongs.routeName: (ctx) => const TeachingAidSongs()
        },
      ),
    );
  }
}
