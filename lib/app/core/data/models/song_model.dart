import 'package:smoothy/app/core/domain/entities/song_entity.dart';

class SongModel extends SongEntity {

  const SongModel({
    required super.id,
    required super.name,
    required super.cover,
    required super.audio,
    required super.author,
    required super.isLocal,
    required super.lenght
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
        id: json['id'],
        name: json['name'],
        cover: json['cover'],
        audio: json['audio'],
        author: json['author'],
        isLocal: json['is-local'],
        lenght: json['lenght']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['audio'] = audio;
    data['author'] = author;
    data['is-local'] = isLocal;
    data['lenght'] = lenght;
    return data;
  }
}