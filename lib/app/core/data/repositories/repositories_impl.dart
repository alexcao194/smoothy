import 'package:dartz/dartz.dart';
import 'package:smoothy/app/core/data/datasource/cache_data.dart';
import 'package:smoothy/app/core/data/datasource/local_data.dart';
import 'package:smoothy/app/core/data/datasource/remote_data.dart';
import 'package:smoothy/app/core/data/models/play_list_model.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/entities/play_list_entity.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/core/error/exceptions.dart';
import 'package:smoothy/core/error/failures.dart';
import 'package:smoothy/core/network/network_info.dart';
import 'package:smoothy/core/services/sorter/song_sorter/song_sorter.dart';

class RepositoriesImpl implements Repositories {
  const RepositoriesImpl({
    required this.remoteData,
    required this.localData,
    required this.cacheData,
    required this.networkInfo,
    required this.songSorter
  });

  final CacheData cacheData;
  final LocalData localData;
  final RemoteData remoteData;
  final NetworkInfo networkInfo;
  final SongSorter songSorter;

  @override
  Future<Either<Failure, bool>> cacheSong(SongModel song) async {
    try {
      await cacheData.cacheSong(song);
      return const Right(true);
    } on LocalException {
      return const Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, PlayListEntity>> getPlayList(String id) async {
    PlaylistModel localPlayList;
    PlaylistModel remotePlayList;
    try {
      localPlayList = await localData.getPlayList(id);
      try {
        remotePlayList = await remoteData.getPlayList(id);
        return Right(songSorter.sort(_mergePlayList(localPlayList, remotePlayList)));
      } on InternalServerException {
        return Right(localPlayList);
      }
    } on LocalException {
      try {
        remotePlayList = await remoteData.getPlayList(id);
        return Right(remotePlayList);
      } on InternalServerException {
        return const Left(InternalFailure());
      }
    }
  }

  PlaylistModel _mergePlayList(PlaylistModel localPlayList, PlaylistModel remotePlayList) {
    var listSong = <SongModel>[];
    for (var song in localPlayList.listSongModal) {
      listSong.add(song);
    }
    for (var song in remotePlayList.listSongModal) {
      if(!_findSong(song, listSong)) {
        listSong.add(song);
      }
    }
    return PlaylistModel(
        id: localPlayList.id,
        cover: localPlayList.cover,
        name: localPlayList.name,
        songCount: listSong.length,
        listSongModal: listSong
    );
  }

  bool _findSong(SongModel song, List<SongModel> listSong) {
    for(var element in listSong) {
      if(song.id == element.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<Either<Failure, SongModel>> getSongFromCache() async {
    try {
      final song = await cacheData.getSong();
      return Right(song);
    } on LocalException {
      return const Left(LocalFailure());
    }
  }
}