import 'package:acm_diocese_of_calabar/models/objectlesson.dart';
import 'package:acm_diocese_of_calabar/provider/object_lesson_provider.dart';
import 'package:flutter/material.dart';




class FavObjectLessonFloatingButton extends StatefulWidget {
  final ObjectLessonProvider providerData;
  final ObjectLessonAid objectLesson;
  const FavObjectLessonFloatingButton(
      {required this.providerData, required this.objectLesson, Key? key})
      : super(key: key);

  @override
  _FavObjectLessonFloatingButtonState createState() => _FavObjectLessonFloatingButtonState();
}

class _FavObjectLessonFloatingButtonState extends State<FavObjectLessonFloatingButton> {
  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      onPressed: () {
        widget.providerData.favLogic(widget.objectLesson);
        setState(() {});
      },
      backgroundColor: Colors.yellow,
      elevation: 25,
      child: widget.providerData.objectLessonAidFavList
              .any((element) => element.id == widget.objectLesson.id)
          ? const Icon(
              Icons.star_rounded,
              size: 30,
            )
          : const Icon(
              Icons.star_border_rounded,
              size: 30,
            ),
    );
  }
}