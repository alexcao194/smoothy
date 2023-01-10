import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/entities/play_list_entity.dart';

class PlaylistModel extends PlayListEntity {
  const PlaylistModel({
    required super.id,
    required super.cover,
    required super.name,
    required super.songCount,
    required this.listSongModal
  }) : super(listSong: listSongModal);

  final List<SongModel> listSongModal;

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    final listSongModal = <SongModel>[];
    if (json['list-song'] != null) {
      json['list-song'].forEach((v) {
        listSongModal.add(SongModel.fromJson(v));
      });
    }
    return PlaylistModel(
      id : json['id'],
      cover : json['cover'],
      name : json['name'],
      songCount : json['song-count'],
      listSongModal: listSongModal
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cover'] = cover;
    data['name'] = name;
    data['song-count'] = songCount;
    data['list-song'] = listSongModal.map((v) => v.toJson()).toList();
    return data;
  }
}
