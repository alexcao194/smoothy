class PlayListEntity {
  final String id;
  final String cover;
  final String name;
  final int songCount;
  final List<ListSongEntity>? listSong;

  PlayListEntity({
    required this.id,
    required this.cover,
    required this.name,
    required this.songCount,
    required this.listSong
  });
}

class ListSongEntity {
  final String id;
  final String name;
  final String author;
  final String cover;
  final String audioLink;
  final bool isLocal;

  ListSongEntity({
    required this.id,
    required this.name,
    required this.author,
    required this.cover,
    required this.audioLink,
    required this.isLocal
  });
}