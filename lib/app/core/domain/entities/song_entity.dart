import 'package:equatable/equatable.dart';

class SongEntity extends Equatable {
  final String id;
  final String name;
  final String cover;
  final String audio;
  final String author;
  final bool isLocal;

  const SongEntity({
    required this.id,
    required this.name,
    required this.cover,
    required this.audio,
    required this.author,
    required this.isLocal
  });

  @override
  List<Object?> get props => [id, name, cover, audio, author];
}