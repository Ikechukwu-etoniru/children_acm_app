import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/song.dart';

class SingleSongScreen extends StatelessWidget {
  static const routeName = '/single_song_screen.dart';
  const SingleSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final song = arguments['1'] as SongAid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: DashboardScreen.primaryColor,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.yellow,
        elevation: 25,
        child: Icon(
          Icons.star_rounded,
          size: 30,
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [Text(song.songLyrics)],
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
              ),
              child: Icon(
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
