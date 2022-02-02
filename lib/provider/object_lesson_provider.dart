import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';

import '/models/objectlesson.dart';

class ObjectLessonProvider with ChangeNotifier {
  final List<ObjectLessonAid> _objectLessonList = [
    ObjectLessonAid(
        id: '1',
        title: 'ghdjsldldlfkf',
        description: 'teyey rgffjfjf fhfjfkfkd dgshsjsjdbd',
        category: TaCategory.christmas,
        tags: ['object', 'object lesson', 'christmas']),
    ObjectLessonAid(
        id: '2',
        title: 'ghdjsldldlfkf',
        description:
            'teyey rgffjfjf fhfnfjfjkf fflfgpg glhkhmh jfkfkd dgshsjsjdbd',
        category: TaCategory.easter,
        tags: ['object', 'object lesson', 'christmas']),
    ObjectLessonAid(
        id: '3',
        title: 'ghdjsldldlfkdjdkdkf',
        description: 'teyey rgffjfmdmldlf fflpd ddkdlfjf fhfjfkfkd dgshsjsjdbd',
        category: TaCategory.faith,
        tags: ['object', 'object lesson', 'christmas'])
  ];

  List<ObjectLessonAid> get objectLessonList {
    return [..._objectLessonList];
  }

  List<ObjectLessonAid> objectLessonByCategory(String categ) {
    if (categ == 'All') {
      return _objectLessonList;
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
    return _objectLessonList
        .where((element) => element.category == category)
        .toList();
  }

  int numberPerCategory(String cate) {
    if (cate == 'All') {
      return _objectLessonList.length;
    }
    return _objectLessonList
        .where(
            (object) => object.category.toString().contains(cate.toLowerCase()))
        .toList()
        .length;
  }

  List<ObjectLessonAid> getObjectLessonByTag(String tag) {
    return _objectLessonList
        .where((element) => element.tags.contains(tag))
        .toList();
  }

  final List<ObjectLessonAid> _objectLessonAidFavList = [
    ObjectLessonAid(
        id: '10',
        title: 'ghdjsljgjh  lk dldlfkf',
        description: 'teyey rgffjfjf fhfjfkfkd dgshsjsjdbd',
        category: TaCategory.christmas,
        tags: ['object', 'object lesson', 'christmas'])
  ];

  List<ObjectLessonAid> get objectLessonAidFavList {
    return [..._objectLessonAidFavList];
  }

  void favLogic(ObjectLessonAid favObjectLesson) {
    if (_objectLessonAidFavList
            .any((element) => element.id == favObjectLesson.id) ==
        true) {
      _objectLessonAidFavList
          .removeWhere((element) => favObjectLesson.id == element.id);
    } else {
      _objectLessonAidFavList.insert(0, favObjectLesson);
    }
  }
}
