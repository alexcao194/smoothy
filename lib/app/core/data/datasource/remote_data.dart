import 'package:dio/dio.dart';
import 'package:smoothy/app/core/data/models/play_list_model.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class RemoteData {
  const RemoteData();
  Future<void> downloadSong(String id);
  Future<PlaylistModel> getPlayList(String id);
}

class RemoteDataImpl extends RemoteData {
  const RemoteDataImpl({required this.dio});

  final Dio dio;

  @override
  Future<void> downloadSong(String id) {
    // TODO: implement downloadSong
    throw UnimplementedError();
  }

  @override
  Future<PlaylistModel> getPlayList(String id) async {
    return PlaylistModel(
        id: id,
        cover: 'https://cdn.discordapp.com/attachments/960780341952544798/1061999001609711666/binztop-1643227243-6156-1643227859.jpg',
        name: "Tuyển tập Binz",
        songCount: 2,
        listSongModal: const <SongModel>[
          SongModel(
              id: 'ZOAC7BUF',
              name: 'Cho mình em',
              cover: 'https://cdn.discordapp.com/attachments/960780341952544798/1062000176765620286/793cb0dc6bf49c1640db7726dcab3504.jpg',
              audio: 'http://api.mp3.zing.vn/api/streaming/audio/ZOAC7BUF/320',
              author: 'Binz',
              lenght: 206,
              isLocal: false
          ),
          SongModel(
              id: 'ZWBUA8B8',
              name: 'Bigcityboy',
              cover: 'https://cdn.discordapp.com/attachments/960780341952544798/1062000649937629204/Binz_-_Bigcityboi.jpg',
              audio: 'http://api.mp3.zing.vn/api/streaming/audio/ZWBUA8B8/320',
              author: 'Binz',
              lenght: 201,
              isLocal: false
          )
        ]
    );
  }
}