import 'package:dartz/dartz.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/core/error/failures.dart';
import 'package:smoothy/core/usecases/usecase.dart';

class GetSongFromCache extends UseCase<SongEntity, NoParams> {
  const GetSongFromCache({required this.repositories});

  final Repositories repositories;

  @override
  Future<Either<Failure, SongEntity>> call(NoParams params) async {
    return await repositories.getSongFromCache();
  }
}

