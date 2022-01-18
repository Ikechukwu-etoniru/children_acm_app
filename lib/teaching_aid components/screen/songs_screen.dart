import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:acm_diocese_of_calabar/provider/songs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';

class TeachingAidSongs extends StatelessWidget {
  static const routeName = '/songs.dart';
  const TeachingAidSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context);
    final deviceHeight = dH.size.height - dH.padding.top;
    final deviceWidth = dH.size.width;
    final List<SongAid> songList = Provider.of<SongProvider>(context).songList;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Song List',
          style: TextStyle(
              color: DashboardScreen.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: DashboardScreen.primaryColor.withOpacity(0.1),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_left,
              size: 40,
              color: DashboardScreen.primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              height: deviceHeight * 0.7,
              width: deviceWidth,
              child: ListView.builder(
                  itemCount: songList.length,
                  itemBuilder: (context, index) =>
                      SongListContainer(songList[index])))
        ],
      ),
    );
  }
}

class SongListContainer extends StatelessWidget {
  final SongAid song;
  const SongListContainer(this.song, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          CircleAvatar(radius: 40),
          Column(
            children: [
              Text(song.title),
              Chip(
                label: Text(song.category.toString()),
                elevation: 20,
              )
            ],
          )
        ],
      ),
      
    );
  }
}
