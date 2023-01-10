import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  const AuthorEntity({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}