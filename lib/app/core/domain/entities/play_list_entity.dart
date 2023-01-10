import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';

class PlayListEntity extends Equatable {
  final String id;
  final String cover;
  final String name;
  final int songCount;
  final List<SongEntity> listSong;

  const PlayListEntity({
    required this.id,
    required this.cover,
    required this.name,
    required this.songCount,
    required this.listSong
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, cover, name, songCount, listSong];
}
