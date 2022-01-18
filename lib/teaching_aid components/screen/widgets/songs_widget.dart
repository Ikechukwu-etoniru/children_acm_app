import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/song.dart';
import '/provider/songs_provider.dart';

class TeachingAidSongWidget extends StatelessWidget {
  const TeachingAidSongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SongAid> _songAids = Provider.of<SongProvider>(context).songList;
    return ListView.builder(
      itemCount: _songAids.length,
      itemBuilder: (context, index) => SongContainer(_songAids[index]),
    );
  }
}

class SongContainer extends StatelessWidget {
  final SongAid song;
  const SongContainer(this.song, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple.withOpacity(0.05),
          boxShadow: const [
            BoxShadow(
                color: Colors.red,
                blurStyle: BlurStyle.outer,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(1, 1))
          ]),
      child: Column(
        children: [
          Text(song.title),
          Text(' Category - ${song.category.toString().substring(11)}')
        ],
      ),
    );
  }
}
