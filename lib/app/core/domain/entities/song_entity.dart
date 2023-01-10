import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/domain/entities/author_entity.dart';

class SongEntity extends Equatable {
  final String id;
  final String name;
  final String cover;
  final String audio;
  final List<AuthorEntity> author;
  final bool isLocal;
  final int lenght;

  const SongEntity({
    required this.id,
    required this.name,
    required this.cover,
    required this.audio,
    required this.author,
    required this.isLocal,
    required this.lenght
  });

  @override
  List<Object?> get props => [id, name, cover, audio, author, lenght];
}