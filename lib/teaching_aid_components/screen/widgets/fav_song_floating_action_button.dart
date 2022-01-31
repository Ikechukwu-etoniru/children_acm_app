import 'package:flutter/material.dart';

import '/models/song.dart';
import '/provider/songs_provider.dart';

class FavFloatingButton extends StatefulWidget {
  final SongProvider providerData;
  final SongAid song;
  const FavFloatingButton(
      {required this.providerData, required this.song, Key? key})
      : super(key: key);

  @override
  _FavFloatingButtonState createState() => _FavFloatingButtonState();
}

class _FavFloatingButtonState extends State<FavFloatingButton> {
  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      onPressed: () {
        widget.providerData.favLogic(widget.song);
        setState(() {});
      },
      backgroundColor: Colors.yellow,
      elevation: 25,
      child: widget.providerData.songAidFavList
              .any((element) => element.id == widget.song.id)
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
