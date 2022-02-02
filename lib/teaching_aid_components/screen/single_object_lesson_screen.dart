import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/objectlesson.dart';
import '/favorite_components/favourite_list_screen.dart';
import '/provider/object_lesson_provider.dart';
import '/teaching_aid_components/screen/widgets/fav_objectlesson_floating_button.dart';

class SingleObjectLessonScreen extends StatelessWidget {
  static const routeName = '/single_object_lesson_screen.dart';
  const SingleObjectLessonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final objectLesson = arguments['1'] as ObjectLessonAid;
    final id = arguments['2'] as String;
    final objectLessonProvider = Provider.of<ObjectLessonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (id.isEmpty) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushReplacementNamed(
                  FavouriteListScreen.routeName,
                  arguments: {'2': id});
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: DashboardScreen.primaryColor,
          ),
        ),
      ),
      floatingActionButton: FavObjectLessonFloatingButton(
          providerData: objectLessonProvider, objectLesson: objectLesson),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Text(
              objectLesson.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              objectLesson.description,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
