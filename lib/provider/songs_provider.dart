import 'package:flutter/material.dart';
import '/models/song.dart';

class SongProvider with ChangeNotifier {
  final List<SongAid> _songList = [
    SongAid(
        category: TaCategory.christmas,
        songUrl: 'welcome.com',
        title: 'All i want for christams',
        id: '1'),
    SongAid(
        category: TaCategory.faith,
        songUrl: 'welcome.com',
        title: 'All i want for christams',
        id: '2'),
    SongAid(
        category: TaCategory.easter,
        songUrl: 'welcome.com',
        title: 'All i want for christams',
        id: '3'),
  ];

  List<SongAid> get songList {
    return [..._songList];
  }
}
