import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/config/app_paths.dart';
import 'package:smoothy/core/error/exceptions.dart';

abstract class CacheData {
  const CacheData();
  Future<void> cacheSong(SongModel songModel);
  Future<SongModel> getSong();
}

class CacheDataImpl implements CacheData {
  const CacheDataImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;
  static const SONG_TO_CACHE = "song-to-cache";

  @override
  Future<void> cacheSong(SongModel songModel) async {
    try {
      await sharedPreferences.setString(SONG_TO_CACHE, json.encode(songModel));
    } catch (error) {
      throw LocalException();
    }
  }

  @override
  Future<SongModel> getSong() {
    final jsonResult = sharedPreferences.getString(SONG_TO_CACHE);
    if(jsonResult != null) {
      return Future.value(SongModel.fromJson(json.decode(jsonResult)));
    } else {
      return Future.value(const SongModel(
          id: '-1',
          name: 'Tên bài hát',
          cover: AppPath.defaultSong,
          audio: '',
          author: 'Tác giả',
          lenght: 0,
          isLocal: true
      ));
    }
  }
}