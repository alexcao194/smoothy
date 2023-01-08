import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class CacheData {
  const CacheData();
  Future<void> saveSong(SongModel songModel);
  Future<SongModel> getSong(String id);
}

class CacheDataImpl implements CacheData {
  const CacheDataImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<SongModel> getSong(String id) {
    // TODO: implement getSong
    throw UnimplementedError();
  }

  @override
  Future<void> saveSong(SongModel songModel) {
    // TODO: implement saveSong
    throw UnimplementedError();
  }
}