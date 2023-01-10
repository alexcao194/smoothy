import 'package:smoothy/app/core/domain/entities/song_entity.dart';

class PlayListEntity {
  final String id;
  final String cover;
  final String name;
  final int songCount;
  final List<SongEntity> listSong;

  PlayListEntity({
    required this.id,
    required this.cover,
    required this.name,
    required this.songCount,
    required this.listSong
  });
}
