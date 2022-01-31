import 'package:acm_diocese_of_calabar/favorite_components/favourite_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/object_lesson_provider.dart';
import 'teaching_aid_components/screen/single_story_screen.dart';
import 'teaching_aid_components/screen/teaching_aid_artwork.dart';
import 'teaching_aid_components/screen/teaching_aid_screen.dart';
import 'teaching_aid_components/screen/teaching_aid_songs.dart';
import 'training_components/screens/training_screen.dart';
import 'dashboard_components/screens/dashboard_screen.dart';
import '/provider/songs_provider.dart';
import '/provider/story_provider.dart';
import '/provider/courses_provider.dart';
import '/provider/artwork_provider.dart';
import '/training_components/screens/training_courses_screen.dart';
import '/teaching_aid_components/screen/single_song_screen.dart';
import '/teaching_aid_components/screen/teaching_aid_story.dart';
import '/search_components/search_screen.dart';
import '/teaching_aid_components/screen/single_artwork_screen.dart';
import '/teaching_aid_components/screen/single_object_lesson_screen.dart';
import '/teaching_aid_components/screen/teaching_aid_objectlesson.dart';
import '/favorite_components/favourite_screen.dart';

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
        ),
        ChangeNotifierProvider(
          create: (_) => ArtworkProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ObjectLessonProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ACM',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
          ),
        ),
        home: DashboardScreen(),
        routes: {
          TrainingScreen.routeName: (ctx) => TrainingScreen(),
          TeachingAidScreen.routeName: (ctx) => TeachingAidScreen(),
          TrainingCoursesScreen.routeName: (ctx) =>
              const TrainingCoursesScreen(),
          TeachingAidSongScreen.routeName: (ctx) =>
              const TeachingAidSongScreen(),
          SingleSongScreen.routeName: (ctx) => const SingleSongScreen(),
          TeachingAidStoryScreen.routeName: (ctx) =>
              const TeachingAidStoryScreen(),
          SingleStoryScreen.routeName: (ctx) => const SingleStoryScreen(),
          TeachingAidArtworkScreen.routeName: (ctx) =>
              const TeachingAidArtworkScreen(),
          SingleArtworkScreen.routeName: (ctx) => const SingleArtworkScreen(),
          TeachingAidObjectLessonScreen.routeName: (ctx) =>
              const TeachingAidObjectLessonScreen(),
          SingleObjectLessonScreen.routeName: (ctx) =>
              const SingleObjectLessonScreen(),
          SearchScreen.routeName: (ctx) => const SearchScreen(),
          FavouriteScreen.routeName: (ctx) => const FavouriteScreen(),
          FavouriteListScreen.routeName : (ctx) => const FavouriteListScreen()
        },
      ),
    );
  }
}
