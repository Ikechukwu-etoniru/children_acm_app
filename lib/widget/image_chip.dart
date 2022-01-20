import 'package:acm_diocese_of_calabar/models/song.dart';
import 'package:flutter/material.dart';

class ImageChip extends StatelessWidget {
  final TaCategory cate;
  const ImageChip(this.cate, {Key? key}) : super(key: key);

  String get imageName {
    if (cate == TaCategory.christmas) {
      return 'images/christmas_pic.png';
    } else if (cate == TaCategory.easter) {
      return 'images/easter_pic.png';
    } else if (cate == TaCategory.faith) {
      return 'images/faith_pic.png';
    } else {
      return 'images/happy_girl.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundImage: AssetImage(imageName),
    );
  }
}
