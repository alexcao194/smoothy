import 'package:dartz/dartz.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/entities/play_list_entity.dart';
import 'package:smoothy/core/error/failures.dart';

abstract class Repositories {
  Future<Either<Failure, bool>> cacheSong(SongModel song);
  Future<Either<Failure, PlayListEntity>> getPlayList(String id);
  Future<Either<Failure, SongModel>> getSongFromCache();
}

