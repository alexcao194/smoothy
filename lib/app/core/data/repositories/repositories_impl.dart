import 'package:dartz/dartz.dart';
import 'package:smoothy/app/core/data/datasource/cache_data.dart';
import 'package:smoothy/app/core/data/datasource/local_data.dart';
import 'package:smoothy/app/core/data/datasource/remote_data.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/core/error/exceptions.dart';
import 'package:smoothy/core/error/failures.dart';
import 'package:smoothy/core/network/network_info.dart';

class RepositoriesImpl implements Repositories {
  const RepositoriesImpl({
    required this.remoteData,
    required this.localData,
    required this.cacheData,
    required this.networkInfo
  });

  final CacheData cacheData;
  final LocalData localData;
  final RemoteData remoteData;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, bool>> saveSong(SongModel song) {
    // TODO: implement saveSong
    throw UnimplementedError();
  }
}