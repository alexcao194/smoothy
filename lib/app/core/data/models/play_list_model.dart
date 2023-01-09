import 'package:smoothy/app/core/domain/entities/play_list_entity.dart';

class PlaylistModal extends PlayListEntity {
  PlaylistModal({
    required super.id,
    required super.cover,
    required super.name,
    required super.songCount,
    required this.listSongModal
  }) : super(listSong: listSongModal);

  final List<ListSongModal> listSongModal;

  factory PlaylistModal.fromJson(Map<String, dynamic> json) {
    final listSongModal = <ListSongModal>[];
    if (json['list-song'] != null) {
      json['list-song'].forEach((v) {
        listSongModal.add(ListSongModal.fromJson(v));
      });
    }
    return PlaylistModal(
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

class ListSongModal extends ListSongEntity {
  ListSongModal({
    required super.id,
    required super.name,
    required super.author,
    required super.cover,
    required super.audioLink,
    required super.isLocal
  });

  factory ListSongModal.fromJson(Map<String, dynamic> json) {
    return ListSongModal(
      id : json['id'],
      name : json['name'],
      author : json['author'],
      cover : json['cover'],
      audioLink : json['audio-link'],
      isLocal : json['is-local']
    );
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author'] = author;
    data['cover'] = cover;
    data['audio-link'] = audioLink;
    data['is-local'] = isLocal;
    return data;
  }
}
