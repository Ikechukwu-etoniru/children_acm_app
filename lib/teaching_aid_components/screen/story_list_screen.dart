import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/story.dart';
import '/provider/story_provider.dart';

class StoryListScreen extends StatelessWidget {
  final String taCategory;
  const StoryListScreen({required this.taCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final storyList =
        Provider.of<StoryProvider>(context).storyByCategory(taCategory);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                itemCount: storyList.length,
                itemBuilder: (ctx, index) {
                  return SingleStoryContainer(
                    height: deviceHeight * 0.1,
                    story: storyList[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SingleStoryContainer extends StatelessWidget {
  final double height;
  final StoryAid story;
  const SingleStoryContainer(
      {required this.height, required this.story, Key? key})
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
          const SizedBox(
            width: 15,
          ),
          Stack(children: const [
            Center(
              child: Icon(Icons.menu_book,
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
          const SizedBox(
            width: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: height * 0.9,
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    story.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 3),
                const FittedBox(
                  child: Text(
                    'story details',
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(SingleSongScreen.routeName,
              //     arguments: {'1': song});
            },
            child: const Icon(
              Icons.forward,
              color: Colors.yellow,
              size: 40,
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
