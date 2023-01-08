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
  Future<Either<Failure, SongEntity>> getSong(String id) async {
    // check if the song has been downloaded
    // If so, get it in local storage,
    if(await localData.hasSong(id)) {
      try {
        final song = await localData.getSong(id);
        return Right(song);
      } on LocalException {
        return Left(LocalFailure());
      }
    } else {
      // If not, check the network and get it online
      if(await networkInfo.isConnected) {
        try {
          final song = await remoteData.getSong(id);
          return Right(song);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        // if there is no internet, throw Failure
        return Left(NetworkFailure());
      }
    }
  }

  @override
  Future<Either<Failure, bool>> saveSong(SongModel song) {
    // TODO: implement saveSong
    throw UnimplementedError();
  }
}