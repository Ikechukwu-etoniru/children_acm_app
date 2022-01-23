import 'package:flutter/material.dart';
import '/models/song.dart';

class SongProvider with ChangeNotifier {
  final List<SongAid> _songList = [
    SongAid(
        category: TaCategory.christmas,
        songUrl: 'welcome.com',
        title: 'All i want for christams',
        id: '1',
        songLyrics: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr '),
    SongAid(
        category: TaCategory.faith,
        songUrl: 'welcome.com',
        title: 'All i want for christams',
        id: '2',
        songLyrics: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr '),
    SongAid(
        category: TaCategory.easter,
        songUrl: 'welcome.com',
        title: 'All i want for christams',
        id: '3',
        songLyrics: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr '),
  ];

  List<SongAid> get songList {
    return [..._songList];
  }

  List<SongAid> filterByCategories(List<TaCategory> cateList) {
    return _songList.where((song) => cateList.contains(song.category)).toList();
  }
}
