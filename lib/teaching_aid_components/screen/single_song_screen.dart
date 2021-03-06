import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/song.dart';
import '/provider/songs_provider.dart';
import 'widgets/fav_song_floating_action_button.dart';
import '/favorite_components/favourite_list_screen.dart';

class SingleSongScreen extends StatelessWidget {
  static const routeName = '/single_song_screen.dart';
  const SingleSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final song = arguments['1'] as SongAid;
    final id = arguments['2'] as String;
    final songProvider = Provider.of<SongProvider>(context);
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
      floatingActionButton: FavFloatingButton(
        providerData: songProvider,
        song: song,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                Text(
                  song.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  song.videoUrl != null
                      ? '(Audio and video is available for this song)'
                      : '(Only audio is available for this song)',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 15),
                Text(
                  song.songLyrics,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                if (song.videoUrl != null)
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                    child: const Center(
                      child: Text('Video will show here'),
                    ),
                  )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: Container(
              height: 55,
              width: 80,
              decoration: BoxDecoration(
                  color: DashboardScreen.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                        blurRadius: 10)
                  ]),
              child: const Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
