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

  List<SongAid> songsByCategory(String categ) {
    if (categ == 'All') {
      return _songList;
    }
    TaCategory category = categ == 'Faith'
        ? TaCategory.faith
        : categ == 'General'
            ? TaCategory.general
            : categ == 'Christmas'
                ? TaCategory.christmas
                : categ == 'Love'
                    ? TaCategory.love
                    : categ == 'Easter'
                        ? TaCategory.easter
                        : categ == 'Father\'s Day'
                            ? TaCategory.fathers
                            : categ == 'Mother\'s Day'
                                ? TaCategory.mothers
                                : categ == 'Repentance'
                                    ? TaCategory.repentance
                                    : categ == 'Forgiveness'
                                        ? TaCategory.forgiveness
                                        : TaCategory.general;
    return _songList.where((element) => element.category == category).toList();
  }

  int numberPerCategory(String cate) {
    if (cate == 'All') {
      return _songList.length;
    }
    return _songList
        .where((song) => song.category.toString().contains(cate.toLowerCase()))
        .toList()
        .length;
  }
}
