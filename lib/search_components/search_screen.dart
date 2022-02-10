import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/artwork_provider.dart';
import '/provider/object_lesson_provider.dart';
import '/provider/songs_provider.dart';
import '/provider/story_provider.dart';
import '/screen/app_drawer.dart';
import '/search_components/widgets/search_result_container.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search_screen.dart';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _showSearchBar = false;
  String? searchPhrase;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final devicewidth = MediaQuery.of(context).size.width;
    final songList = searchPhrase == null
        ? []
        : Provider.of<SongProvider>(context)
            .getSongByTag(searchPhrase!.trim().toLowerCase());
    final storyList = searchPhrase == null
        ? []
        : Provider.of<StoryProvider>(context)
            .getStoryByTag(searchPhrase!.trim().toLowerCase());
    final artworkList = searchPhrase == null
        ? []
        : Provider.of<ArtworkProvider>(context)
            .getArtworkByTag(searchPhrase!.trim().toLowerCase());
    final objectLessonList = searchPhrase == null
        ? []
        : Provider.of<ObjectLessonProvider>(context)
            .getObjectLessonByTag(searchPhrase!.trim().toLowerCase());
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              Future.delayed(const Duration(milliseconds: 500), () {
                FocusScope.of(context).unfocus();
              });
            },
            icon: const Icon(
              Icons.menu_open_rounded,
              size: 30,
              color: Colors.black,
            ),
          );
        }),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Get all the resources you need for a bible study with one',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
          if (!_showSearchBar)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showSearchBar = true;
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow),
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(2, 5)),
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(-2, 5)),
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 20,
                          offset: const Offset(2, 10)),
                    ]),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          if (_showSearchBar)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: deviceHeight * 0.08,
              width: devicewidth,
              child: Row(children: [
                Expanded(
                  child: Container(
                    height: (deviceHeight * 0.08) * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        searchPhrase = value;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Keyword (Example \'Faith\')',
                        contentPadding: const EdgeInsets.only(
                            left: 10, bottom: 5, right: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5)),
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(-2, 5)),
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: const Offset(2, 10)),
                        ]),
                    child: const Center(
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          if (_showSearchBar && searchPhrase != null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: searchPhrase!.isEmpty
                    ? const Center(
                        child: Text(
                          'Search box is empty',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    : songList.isEmpty &&
                            storyList.isEmpty &&
                            artworkList.isEmpty &&
                            objectLessonList.isEmpty
                        ? Center(
                            child: Text(
                              "We don't have any teaching aids for '$searchPhrase'",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : ListView(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text(
                                  "Showing results for '$searchPhrase'",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SearchResultContainer(
                                teachingAid: songList,
                                color: const Color(0xff312c76),
                                imageName: 'images/song_icon.png',
                                height: deviceHeight * 0.18,
                                width: devicewidth * 0.92,
                                type: const ['Song', 'Songs'],
                                id: 1,
                              ),
                              SearchResultContainer(
                                  teachingAid: storyList,
                                  color: const Color(0xfffce9e1),
                                  imageName: 'images/story_icon.png',
                                  height: deviceHeight * 0.18,
                                  width: devicewidth * 0.9,
                                  type: const ['Story', 'Stories'],
                                  id: 2),
                              SearchResultContainer(
                                teachingAid: artworkList,
                                color: const Color(0xffffe8e7),
                                imageName: 'images/art_icon.png',
                                height: deviceHeight * 0.18,
                                width: devicewidth * 0.9,
                                type: const ['Artwork', 'Artworks'],
                                id: 3,
                              ),
                              SearchResultContainer(
                                teachingAid: objectLessonList,
                                color: const Color(0xff9897ae),
                                imageName: 'images/object_lesson_icon.png',
                                height: deviceHeight * 0.18,
                                width: devicewidth * 0.9,
                                type: const ['Object lesson', 'Object lessons'],
                                id: 4,
                              )
                            ],
                          ),
              ),
            )
        ],
      ),
    );
  }
}
