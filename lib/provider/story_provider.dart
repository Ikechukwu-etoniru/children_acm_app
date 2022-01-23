import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';
import '/models/story.dart';

class StoryProvider with ChangeNotifier {
  final List<StoryAid> _storyList = [
    StoryAid(
        category: TaCategory.christmas,
        title: 'All i want for christams',
        id: '1',
        story: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr '),
    StoryAid(
        category: TaCategory.faith,
        title: 'All i want for christams',
        id: '2',
        story: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr '),
    StoryAid(
        category: TaCategory.easter,
        title: 'All i want for christams',
        id: '3',
        story: 'reyeddhud dddhdgdjfjf fhfjfjfjtjr '),
  ];

  List<StoryAid> get storyList {
    return [..._storyList];
  }

  

  List<StoryAid> filterByCategories(List<TaCategory> cateList) {
    return _storyList.where((song) => cateList.contains(song.category)).toList();
  }
}