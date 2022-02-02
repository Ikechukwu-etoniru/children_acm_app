import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';

import '/models/artwork.dart';

class ArtworkProvider with ChangeNotifier {
  final List<ArtworkAid> _artworkList = [
    ArtworkAid(
        id: '1',
        title: 'Bjdkdkfk',
        description: 'ndhdhfjhfjfkfkfkfkkrrr',
        category: TaCategory.christmas,
        tags: ['art', 'artwork', 'christmas']),
    ArtworkAid(
        id: '2',
        title: 'yryjeke',
        description: 'hdgdgdjjkeekjff fngjgkgggmntgjttktitr rrkrkrkrkffkgjgjgg',
        category: TaCategory.easter,
        tags: ['art', 'artwork', 'christmas']),
    ArtworkAid(
        id: '3',
        title: 'ajskdkdkd',
        description:
            'fnhfhfhfjfkfkfkfkfkf fjfnfjf fnfkd dejekj rfjfkjfkjtrjt tjtj',
        category: TaCategory.faith,
        tags: ['art', 'artwork', 'christmas']),
  ];

  List<ArtworkAid> get artworkList {
    return [..._artworkList];
  }

  List<ArtworkAid> artworkByCategory(String categ) {
    if (categ == 'All') {
      return _artworkList;
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
    return _artworkList
        .where((element) => element.category == category)
        .toList();
  }

  int numberPerCategory(String cate) {
    if (cate == 'All') {
      return _artworkList.length;
    }
    return _artworkList
        .where(
            (story) => story.category.toString().contains(cate.toLowerCase()))
        .toList()
        .length;
  }
  List<ArtworkAid> getArtworkByTag (String tag)  {
    return _artworkList.where((element) => element.tags.contains(tag)).toList();
  }

  final List<ArtworkAid> _artworkAidFavList = [
    ArtworkAid(
        id: '10',
        title: 'Bjdkddhd djdjkdkd kfk',
        description: 'ndhdhfjjfjgjghfjfkfkfkfkkrrr',
        category: TaCategory.christmas,
        tags: ['art', 'artwork', 'christmas'])
  ];

  List<ArtworkAid> get artworkAidFavList {
    return [..._artworkAidFavList];
  }

  void favLogic(ArtworkAid favArtwork) {
    if (_artworkAidFavList.any((element) => element.id == favArtwork.id) == true) {
      _artworkAidFavList.removeWhere((element) => favArtwork.id == element.id);
    } else {
      _artworkAidFavList.insert(0, favArtwork);
    }
  }
}
