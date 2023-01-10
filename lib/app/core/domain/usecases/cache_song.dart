import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/core/error/failures.dart';
import 'package:smoothy/core/usecases/usecase.dart';

class CacheSong extends UseCase<bool, Params> {
  const CacheSong({required this.repositories});
  final Repositories repositories;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repositories.cacheSong(params.songModel);
  }

}

class Params extends Equatable {
  const Params({required this.songModel});
  final SongModel songModel;

  @override
  List<Object?> get props => [songModel];
}