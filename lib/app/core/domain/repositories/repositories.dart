import 'package:dartz/dartz.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';
import 'package:smoothy/core/error/failures.dart';

abstract class Repositories {
  Future<Either<Failure, bool>> saveSong(SongModel song);
}

