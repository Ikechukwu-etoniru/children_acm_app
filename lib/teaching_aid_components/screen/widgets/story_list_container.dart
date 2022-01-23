import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/widget/category_chip.dart';
import '/models/story.dart';
import '/teaching_aid_components/screen/single_story_screen.dart';
import '/widget/image_chip.dart';

class StoryListContainer extends StatelessWidget {
  final StoryAid story;
  const StoryListContainer(this.story, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ]),
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            child: ImageChip(story.category),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  height: 30,
                  child: Text(
                    story.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
                CategoryChip(
                  height: 20,
                  width: story.category.toString().substring(11).length * 12,
                  text: story.category.toString().substring(11).toUpperCase(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return SingleStoryScreen(story);
                  },
                ),
              );
            },
            child: Container(
                alignment: Alignment.center,
                width: 50,
                child: const Icon(
                  Icons.arrow_right_rounded,
                  color: DashboardScreen.primaryColor,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }
}
