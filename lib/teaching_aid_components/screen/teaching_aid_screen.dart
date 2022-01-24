import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/screen/app_drawer.dart';
import '/widget/appbar_trailing_icon.dart';
import '/dashboard_components/screens/dashboard_screen.dart';
import 'songs_screen.dart';
import '/teaching_aid_components/screen/story_screen.dart';

class TeachingAidScreen extends StatelessWidget {
  static const routeName = 'teaching_aid_screen.dart';
  TeachingAidScreen({Key? key}) : super(key: key);
  final myAppbar = AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu_open_rounded,
          color: Colors.black,
          size: 25,
        ),
      );
    }),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: const [AppbarTrailingIcon()],
  );

  Widget _teachingAidBlocks(
      {required Color color,
      required String title,
      required String subTitle,
      required int id,
      required String imageName,
      double? deviceHeight,
      double? deviceWidth,
      void Function()? onTap}) {
    final height = deviceHeight! * 0.18;
    final width = deviceWidth! * 0.9;
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: id,
        child: Container(
          margin:
              const EdgeInsets.only(right: 10, left: 10, top: 3, bottom: 10),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 10,
                bottom: 10,
                child: SizedBox(
                  height: height * 0.67,
                  width: width * 0.27,
                  child: Image.asset(
                    imageName,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 30,
                child: Text(
                  title,
                  style: TextStyle(
                    color: id == 2 || id == 3 ? Colors.brown : Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 27,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: SizedBox(
                  width: width * 0.65,
                  height: height * 0.58,
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: id == 2 || id == 3 ? Colors.brown : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final tbHeight = deviceHeight * 0.25;
    final tbWidth = deviceWidth * 0.9;

    return Scaffold(
      appBar: myAppbar,
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: tbHeight,
            width: tbWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xfffde9e5),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xfffde9e5),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: Offset(1, 1),
                  )
                ]),
            child: Stack(
              children: [
                Positioned(
                  right: -25,
                  bottom: 15,
                  child: SizedBox(
                    height: tbHeight * 0.76,
                    width: tbWidth * 0.37,
                    child: Image.asset(
                      'images/featured_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  top: 40,
                  left: 20,
                  child: Text(
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
                  top: 80,
                  left: 20,
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
                    left: 30,
                    bottom: 10,
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
          _teachingAidBlocks(
              color: const Color(0xff312c76),
              title: 'Song',
              subTitle: 'When words fail, songs speak',
              id: 1,
              imageName: 'images/song_icon.png',
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
              onTap: () {
                Navigator.of(context).pushNamed(TeachingAidSongs.routeName);
              }),
          _teachingAidBlocks(
              color: const Color(0xfffce9e1),
              title: 'Story',
              subTitle: 'Every interesting story is a never ending story',
              id: 2,
              imageName: 'images/story_icon.png',
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
              onTap: () {
                Navigator.of(context).pushNamed(TeachingAidStory.routeName);
              }),
          _teachingAidBlocks(
              color: const Color(0xffffe8e7),
              title: 'Art Work',
              subTitle: 'Art is not what you see, but what you make others see',
              id: 3,
              imageName: 'images/art_icon.png',
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth),
          _teachingAidBlocks(
              color: const Color(0xff9897ae),
              title: 'Object Lesson',
              subTitle: 'Objects that illustrate spiritual lessons',
              id: 4,
              imageName: 'images/object_lesson_icon.png',
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth)
        ],
      ),
    );
  }
}
