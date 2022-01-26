enum TaCategory {
  general,
  faith,
  love,
  christmas,
  easter,
  fathers,
  mothers,
  repentance,
  forgiveness,
  
}

class SongAid {
  final String id;
  final TaCategory category;
  final String title;
  final String songUrl;
  final String songLyrics;

  SongAid(
      {required this.id,
      required this.title,
      required this.category,
      required this.songUrl,
      required this.songLyrics});
}
