import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';

import '/models/artwork.dart';

class ArtworkProvider with ChangeNotifier {
  final List<ArtworkAid> _artworkList = [
    ArtworkAid(
        id: '1',
        title: 'Bjdkdkfk',
        description: 'ndhdhfjhfjfkfkfkfkkrrr',
        category: TaCategory.christmas),
    ArtworkAid(
        id: '2',
        title: 'yryjeke',
        description: 'hdgdgdjjkeekjff fngjgkgggmntgjttktitr rrkrkrkrkffkgjgjgg',
        category: TaCategory.easter),
    ArtworkAid(
        id: '3',
        title: 'ajskdkdkd',
        description:
            'fnhfhfhfjfkfkfkfkfkf fjfnfjf fnfkd dejekj rfjfkjfkjtrjt tjtj',
        category: TaCategory.faith),
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
}
