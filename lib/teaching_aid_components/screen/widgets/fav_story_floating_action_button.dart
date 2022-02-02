import 'package:acm_diocese_of_calabar/models/story.dart';
import 'package:acm_diocese_of_calabar/provider/story_provider.dart';
import 'package:flutter/material.dart';



class FavStoryFloatingButton extends StatefulWidget {
  final StoryProvider providerData;
  final StoryAid story;
  const FavStoryFloatingButton(
      {required this.providerData, required this.story, Key? key})
      : super(key: key);

  @override
  _FavStoryFloatingButtonState createState() => _FavStoryFloatingButtonState();
}

class _FavStoryFloatingButtonState extends State<FavStoryFloatingButton> {
  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      onPressed: () {
        widget.providerData.favLogic(widget.story);
        setState(() {});
      },
      backgroundColor: Colors.yellow,
      elevation: 25,
      child: widget.providerData.storyAidFavList
              .any((element) => element.id == widget.story.id)
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