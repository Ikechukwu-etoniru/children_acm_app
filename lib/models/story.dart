import 'package:acm_diocese_of_calabar/models/song.dart';

class StoryAid {
  final String id;
  final TaCategory category;
  final String title;
  final String story;

  StoryAid(
      {required this.id,
      required this.title,
      required this.category,
      required this.story});
}