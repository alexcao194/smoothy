import 'package:dio/dio.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class RemoteData {
  const RemoteData();
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
}