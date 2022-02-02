
import 'package:acm_diocese_of_calabar/provider/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/story.dart';
import '/favorite_components/favourite_list_screen.dart';
import '/teaching_aid_components/screen/widgets/fav_story_floating_action_button.dart';

class SingleStoryScreen extends StatelessWidget {
  static const routeName = '/single_story_screen.dart';
  const SingleStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final story = arguments['1'] as StoryAid;
    final id = arguments['2'] as String;
    final storyProvider = Provider.of<StoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (id.isEmpty) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(FavouriteListScreen.routeName, arguments: {'2' : id});
            }
            
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: DashboardScreen.primaryColor,
          ),
        ),
      ),
      floatingActionButton:FavStoryFloatingButton(
        providerData: storyProvider, 
        story: story),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Text(
              story.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              story.story,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
