import 'package:flutter/material.dart';

import '/models/artwork.dart';
import '/provider/artwork_provider.dart';




class FavArtworkFloatingButton extends StatefulWidget {
  final ArtworkProvider providerData;
  final ArtworkAid artwork;
  const FavArtworkFloatingButton(
      {required this.providerData, required this.artwork, Key? key})
      : super(key: key);

  @override
  _FavArtworkFloatingButtonState createState() => _FavArtworkFloatingButtonState();
}

class _FavArtworkFloatingButtonState extends State<FavArtworkFloatingButton> {
  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      onPressed: () {
        widget.providerData.favLogic(widget.artwork);
        setState(() {});
      },
      backgroundColor: Colors.yellow,
      elevation: 25,
      child: widget.providerData.artworkAidFavList
              .any((element) => element.id == widget.artwork.id)
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
