import 'package:dio/dio.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class RemoteData {
  const RemoteData();
  Future<SongModel> getSong(String id);
  Future<void> saveSong(String id);
}

class RemoteDataImpl extends RemoteData {
  const RemoteDataImpl({required this.dio});

  final Dio dio;
  @override
  Future<void> saveSong(String id) {
    // TODO: implement downloadSong
    throw UnimplementedError();
  }

  @override
  Future<SongModel> getSong(String id) async {
    // TODO: implement getSong
    // Fake data
    return SongModel(
        id: id,
        name: 'Kẻ cắp gặp bà già',
        cover: 'https://discord.com/channels/920286963439894569/960780341952544798/1061565269081862274',
        audio: 'http://api.mp3.zing.vn/api/streaming/audio/ZWBO8OOO/320',
        author: "Hoàng Thùy Linh",
        isLocal: false
    );
  }
}