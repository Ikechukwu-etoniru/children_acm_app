import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/objectlesson.dart';
import '/provider/object_lesson_provider.dart';
import '/teaching_aid_components/screen/single_object_lesson_screen.dart';

class ObjectLessonListScreen extends StatelessWidget {
  final String taCategory;
  const ObjectLessonListScreen({required this.taCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final objectLessonList = Provider.of<ObjectLessonProvider>(context)
        .objectLessonByCategory(taCategory);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          taCategory,
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
      body: Column(
        children: [
          Container(
            height: deviceHeight * 0.06,
            width: deviceWidth,
            margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 10, left: 20, right: 10),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 4)),
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: const Offset(5, 10))
                        ]),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: objectLessonList.length,
                itemBuilder: (ctx, index) {
                  return SingleObjectLessonContainer(
                    height: deviceHeight * 0.1,
                    objectLesson: objectLessonList[index],
                    width: deviceWidth * 0.95,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SingleObjectLessonContainer extends StatelessWidget {
  final double height;
  final ObjectLessonAid objectLesson;
  final double width;
  const SingleObjectLessonContainer(
      {required this.height,
      required this.objectLesson,
      required this.width,
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
                    objectLesson.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 3),
                FittedBox(
                  child: Text(
                    objectLesson.description.substring(0,10),
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                    SingleObjectLessonScreen.routeName,
                    arguments: {'1': objectLesson, '2' : ''});
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
