import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';
import '/models/story.dart';

class StoryProvider with ChangeNotifier {
  final List<StoryAid> _storyList = [
    StoryAid(
        category: TaCategory.christmas,
        title: 'The waiting game',
        id: '1',
        story:
            'hdhdhd ddjdjdmf dbfbdhfjffjgff fjfkffjfnfnf fhjddjdhfhg gngjgjgg',
        tags: ['story', 'story aid', 'christmas']),
    StoryAid(
        category: TaCategory.faith,
        title: 'The Man with 4 wives',
        id: '2',
        story: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr',
        tags: ['story', 'story aid', 'christmas']),
    StoryAid(
        category: TaCategory.easter,
        title: 'The storyy of the pencil',
        id: '3',
        story: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr',
        tags: ['story', 'story aid', 'christmas']),
  ];

  List<StoryAid> get storyList {
    return [..._storyList];
  }

  List<StoryAid> storyByCategory(String categ) {
    if (categ == 'All') {
      return _storyList;
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
    return _storyList.where((element) => element.category == category).toList();
  }

  int numberPerCategory(String cate) {
    if (cate == 'All') {
      return _storyList.length;
    }
    return _storyList
        .where(
            (story) => story.category.toString().contains(cate.toLowerCase()))
        .toList()
        .length;
  }

  List<StoryAid> getStoryByTag(String tag) {
    return _storyList.where((element) => element.tags.contains(tag)).toList();
  }
}
