import 'package:acm_diocese_of_calabar/favorite_components/favourite_list_screen.dart';
import 'package:acm_diocese_of_calabar/provider/songs_provider.dart';
import 'package:flutter/material.dart';

import 'package:acm_diocese_of_calabar/widget/animation_container.dart';
import 'package:acm_diocese_of_calabar/widget/appbar_trailing_icon.dart';
import 'package:provider/provider.dart';
import '/dashboard_components/screens/dashboard_screen.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite_sreen.dart';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final favSongList = Provider.of<SongProvider>(context).songAidFavList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your favourites'),
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
      body: ListView(
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
        ],
      ),
    );
  }
}
