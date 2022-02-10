import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widget/animation_container.dart';
import '/favorite_components/favourite_list_screen.dart';
import '/provider/artwork_provider.dart';
import '/provider/object_lesson_provider.dart';
import '/provider/songs_provider.dart';
import '/provider/story_provider.dart';
import '/widget/appbar_trailing_icon.dart';
import '/dashboard_components/screens/dashboard_screen.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite_sreen.dart';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final favSongList = Provider.of<SongProvider>(context).songAidFavList;
    final favStoryList = Provider.of<StoryProvider>(context).storyAidFavList;
    final favArtworkList =
        Provider.of<ArtworkProvider>(context).artworkAidFavList;
    final favObjectLessonList =
        Provider.of<ObjectLessonProvider>(context).objectLessonAidFavList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your favourites',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: DashboardScreen.primaryColor,
          ),
        ),
        actions: const [AppbarTrailingIcon()],
      ),
      body: 
      // If no favourite has been choosen
      favSongList.isEmpty &&
              favStoryList.isEmpty &&
              favObjectLessonList.isEmpty &&
              favArtworkList.isEmpty
          ? Center(
              child: SizedBox(
                height: deviceHeight * 0.4,
                width: deviceWidth * 0.9,
                child: Column(
                  children: [
                    Expanded(
                        child: Image.asset(
                      'images/happy_girl.png',
                      fit: BoxFit.contain,
                    ),),
                    const Text(
                      'You have not saved any favourites yet !!!!!!!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    )
                  ],
                ),
              ),
            )
          : 
          // If a favourite has been choosen
          ListView(
              children: [
                // Id for animation container in favorites is at least 5 as i want the navigation to be diffrent
                AnimationContainer(
                    routeName: FavouriteListScreen.routeName,
                    color: const Color(0xff312c76),
                    height: deviceHeight * 0.18,
                    width: deviceWidth * 0.9,
                    title: 'Songs',
                    subTitle:
                        'You have saved ${favSongList.length} songs as your favourite',
                    id: 5,
                    imageName: 'images/song_icon.png'),

                AnimationContainer(
                    routeName: FavouriteListScreen.routeName,
                    color: const Color(0xfffce9e1),
                    height: deviceHeight * 0.18,
                    width: deviceWidth * 0.9,
                    title: 'Story',
                    subTitle:
                        'You have saved ${favStoryList.length} story as your favourite',
                    id: 6,
                    imageName: 'images/story_icon.png'),
                AnimationContainer(
                    routeName: FavouriteListScreen.routeName,
                    color: const Color(0xffffe8e7),
                    height: deviceHeight * 0.18,
                    width: deviceWidth * 0.9,
                    title: 'Artwork',
                    subTitle:
                        'You have saved ${favArtworkList.length} artwork as your favourite',
                    id: 7,
                    imageName: 'images/art_icon.png'),
                AnimationContainer(
                    routeName: FavouriteListScreen.routeName,
                    color: const Color(0xff9897ae),
                    height: deviceHeight * 0.18,
                    width: deviceWidth * 0.9,
                    title: 'Object lesson',
                    subTitle:
                        'You have saved ${favObjectLessonList.length} object lessons as your favourite',
                    id: 8,
                    imageName: 'images/object_lesson_icon.png')
              ],
            ),
    );
  }
}
