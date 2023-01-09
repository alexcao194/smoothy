import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class CacheData {
  const CacheData();
  Future<void> saveSong(SongModel songModel);
}

class CacheDataImpl implements CacheData {
  const CacheDataImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> saveSong(SongModel songModel) {
    // TODO: implement saveSong
    throw UnimplementedError();
  }
}