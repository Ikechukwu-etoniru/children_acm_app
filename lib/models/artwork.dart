import 'package:acm_diocese_of_calabar/models/song.dart';

class ArtworkAid {
  final String id;
  final String title;
  final String description;
  final TaCategory category;

  ArtworkAid(
      {required this.id,
      required this.title,
      required this.description,
      required this.category});
}
