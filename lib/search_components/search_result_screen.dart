import 'package:flutter/material.dart';

import '/models/artwork.dart';
import '/models/objectlesson.dart';
import '/models/song.dart';
import '/models/story.dart';
import '/teaching_aid_components/screen/single_artwork_screen.dart';
import '/teaching_aid_components/screen/single_object_lesson_screen.dart';
import '/teaching_aid_components/screen/single_song_screen.dart';
import '/teaching_aid_components/screen/single_story_screen.dart';

import '/dashboard_components/screens/dashboard_screen.dart';

class SearchResultScreen extends StatelessWidget {
  final List<dynamic> teachingAid;
  final String category;
  const SearchResultScreen(
      {Key? key, required this.teachingAid, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            category,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
              color: DashboardScreen.primaryColor,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: teachingAid.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index) => SearchResultScreenContainer(
            height: deviceHeight * 0.13,
            width: deviceWidth,
            singleTeachingAid: teachingAid[index],
            category: category,
          ),
        ));
  }
}

class SearchResultScreenContainer extends StatelessWidget {
  final double height;
  final double width;
  final dynamic singleTeachingAid;
  final String category;
  const SearchResultScreenContainer(
      {required this.height,
      required this.width,
      this.singleTeachingAid,
      required this.category,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.04,
          ),
          SizedBox(
            width: width * 0.2,
            child: Stack(children: const [
              Center(
                child: Icon(Icons.emoji_objects,
                    color: DashboardScreen.primaryColor, size: 60),
              ),
              Positioned(
                top: 22,
                left: 5,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.yellow,
                ),
              ),
              Positioned(
                top: 8,
                left: 13,
                child: CircleAvatar(
                  radius: 1.5,
                  backgroundColor: Colors.yellow,
                ),
              ),
              Positioned(
                top: 5,
                left: 40,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.yellow,
                ),
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: height * 0.9,
            width: width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    singleTeachingAid.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 3),
                FittedBox(
                    child: Text(
                  category == 'Songs'
                      ? singleTeachingAid.songLyrics.substring(0, 5)
                      : category == 'Stories'
                          ? singleTeachingAid.story.substring(0, 5)
                          : category == 'Artworks' ||
                                  category == 'Object lessons'
                              ? singleTeachingAid.description.substring(0, 5)
                              : 'error',
                  style: const TextStyle(color: Colors.grey),
                ))
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (category == 'Songs') {
                  Navigator.of(context).pushNamed(SingleSongScreen.routeName,
                      arguments: {'1': (singleTeachingAid as SongAid)});
                } else if (category == 'Stories') {
                  Navigator.of(context).pushNamed(SingleStoryScreen.routeName,
                      arguments: {'1': (singleTeachingAid as StoryAid)});
                } else if (category == 'Artworks') {
                  Navigator.of(context).pushNamed(SingleArtworkScreen.routeName,
                      arguments: {'1': (singleTeachingAid as ArtworkAid)});
                } else if (category == 'Object lessons') {
                  Navigator.of(context).pushNamed(
                      SingleObjectLessonScreen.routeName,
                      arguments: {'1': (singleTeachingAid as ObjectLessonAid)});
                }
              },
              child: const Icon(
                Icons.forward,
                color: Colors.yellow,
                size: 40,
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
