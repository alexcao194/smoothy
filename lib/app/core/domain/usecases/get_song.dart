import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/core/error/failures.dart';
import 'package:smoothy/core/usecases/usecase.dart';

class GetSong implements UseCase<SongEntity, Params> {
  const GetSong({required this.repositories});
  final Repositories repositories;
  @override
  Future<Either<Failure, SongEntity>> call(Params params) async {
    var c =  await repositories.getSong(params.id);
    return c;
  }
}


class Params extends Equatable {
  const Params({required this.id});
  final String id;

  @override
  List<Object?> get props => [id];
}