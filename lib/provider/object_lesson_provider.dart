import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';

import '/models/objectlesson.dart';

class ObjectLessonProvider with ChangeNotifier {
  final List<ObjectLessonAid> _objectLessonList = [
    ObjectLessonAid(
        id: '1',
        title: 'ghdjsldldlfkf',
        description: 'teyey rgffjfjf fhfjfkfkd dgshsjsjdbd',
        category: TaCategory.christmas),
    ObjectLessonAid(
        id: '2',
        title: 'ghdjsldldlfkf',
        description:
            'teyey rgffjfjf fhfnfjfjkf fflfgpg glhkhmh jfkfkd dgshsjsjdbd',
        category: TaCategory.easter),
    ObjectLessonAid(
        id: '3',
        title: 'ghdjsldldlfkdjdkdkf',
        description: 'teyey rgffjfmdmldlf fflpd ddkdlfjf fhfjfkfkd dgshsjsjdbd',
        category: TaCategory.faith)
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
}
