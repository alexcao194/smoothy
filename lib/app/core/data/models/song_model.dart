import 'package:smoothy/app/core/data/models/author_model.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';

class SongModel extends SongEntity {

  const SongModel({
    required super.id,
    required super.name,
    required super.cover,
    required super.audio,
    required super.isLocal,
    required super.lenght,
    required this.listAuthor
  }) : super(author: listAuthor);

  final List<AuthorModel> listAuthor;

  factory SongModel.fromJson(Map<String, dynamic> json) {
    var listAuthor = <AuthorModel>[];
    if (json['author'] != null) {
      json['author'].forEach((v) {
        listAuthor.add(AuthorModel.fromJson(v));
      });
    }
    return SongModel(
        id: json['id'],
        name: json['name'],
        cover: json['cover'],
        audio: json['audio'],
        isLocal: json['is-local'],
        lenght: json['lenght'],
        listAuthor: listAuthor
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['audio'] = audio;
    data['author'] = listAuthor.map((v) => v.toJson()).toList();
    data['is-local'] = isLocal;
    data['lenght'] = lenght;
    return data;
  }
}