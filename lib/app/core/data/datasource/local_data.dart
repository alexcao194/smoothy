import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class LocalData {
  //  [LocalData] save and get song's info into database(sql, share preferences)
  Future<void> saveSong(SongModel songModel);
  Future<SongModel> getSong(String id);
  Future<bool> hasSong(String id);
}

class LocalDataImpl extends LocalData {
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

  @override
  Future<bool> hasSong(String id) async {
    // TODO: implement hasSong
    return false;
  }

}