import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/screen/app_drawer.dart';
import '/widget/appbar_trailing_icon.dart';
import '/dashboard_components/screens/dashboard_screen.dart';
import '/teaching_aid_components/screen/teaching_aid_songs.dart';
import '/teaching_aid_components/screen/teaching_aid_story.dart';
import 'teaching_aid_artwork.dart';
import '/widget/animation_container.dart';
import 'teaching_aid_objectlesson.dart';

class TeachingAidScreen extends StatelessWidget {
  static const routeName = 'teaching_aid_screen.dart';
  TeachingAidScreen({Key? key}) : super(key: key);
  final _myAppbar = AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu_open_rounded,
          color: Colors.black,
          size: 30,
        ),
      );
    }),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: const [AppbarTrailingIcon()],
  );

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final tbHeight = deviceHeight * 0.25;
    final tbWidth = deviceWidth * 0.9;

    return Scaffold(
      appBar: _myAppbar,
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            height: tbHeight,
            width: tbWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xfffde9e5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xfffde9e5).withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(5, 5),
                  ),
                  BoxShadow(
                    color: const Color(0xfffde9e5).withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(-5, 5),
                  )
                ]),
            child: Stack(
              children: [
                Positioned(
                  right: -15,
                  bottom: tbHeight * 0.07,
                  child: SizedBox(
                    height: tbHeight * 0.70,
                    width: tbWidth * 0.33,
                    child: Image.asset(
                      'images/featured_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: tbHeight * 0.2,
                  left: tbWidth * 0.06,
                  child: const Text(
                    'Teaching Aids',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w800,
                      fontSize: 27,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Positioned(
                  top: tbHeight * 0.41,
                  left: tbWidth * 0.06,
                  child: SizedBox(
                    width: tbWidth * 0.69,
                    height: tbHeight * 0.41,
                    child: const Text(
                      'Learn visual aids that will help grab your children\'s attention',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.brown,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: tbWidth * 0.084,
                    bottom: tbHeight * 0.08,
                    child: Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                        color: DashboardScreen.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Visual aid of the day',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.forward,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 12),
          AnimationContainer(
              routeName: TeachingAidSongScreen.routeName,
              color: const Color(0xff312c76),
              height: deviceHeight * 0.18,
              width: deviceWidth * 0.9,
              title: 'Song',
              subTitle: 'When words fail, songs speak',
              id: 1,
              imageName: 'images/song_icon.png'),
          AnimationContainer(
              routeName: TeachingAidStoryScreen.routeName,
              color: const Color(0xfffce9e1),
              height: deviceHeight * 0.18,
              width: deviceWidth * 0.9,
              title: 'Story',
              subTitle: 'Every interesting story is a never ending story',
              id: 2,
              imageName: 'images/story_icon.png'),
          AnimationContainer(
              routeName: TeachingAidArtworkScreen.routeName,
              color: const Color(0xffffe8e7),
              height: deviceHeight * 0.18,
              width: deviceWidth * 0.9,
              title: 'Art Work',
              subTitle: 'Art is not what you see, but what you make others see',
              id: 3,
              imageName: 'images/art_icon.png'),
          AnimationContainer(
              routeName: TeachingAidObjectLessonScreen.routeName,
              color: const Color(0xff9897ae),
              height: deviceHeight * 0.18,
              width: deviceWidth * 0.9,
              title: 'Object Lesson',
              subTitle: 'Objects that illustrate spiritual lessons',
              id: 4,
              imageName: 'images/object_lesson_icon.png'),
        ],
      ),
    );
  }
}
