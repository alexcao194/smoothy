import 'package:smoothy/app/core/data/models/author_model.dart';
import 'package:smoothy/app/core/data/models/play_list_model.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';

abstract class LocalData {
  //  [LocalData] save and get song's info into database(sql, share preferences)
  Future<PlaylistModel> getPlayList(String id);
}

class LocalDataImpl extends LocalData {

  @override
  Future<PlaylistModel> getPlayList(String id) async {
    return PlaylistModel(
        id: id,
        cover: 'https://cdn.discordapp.com/attachments/960780341952544798/1061999001609711666/binztop-1643227243-6156-1643227859.jpg',
        name: "Tuyển tập Binz",
        songCount: 1,
        listSongModal: const <SongModel>[
          SongModel(
              id: 'ZWBUA8B8',
              name: 'Bigcityboy',
              cover: 'https://cdn.discordapp.com/attachments/960780341952544798/1062000649937629204/Binz_-_Bigcityboi.jpg',
              audio: 'http://api.mp3.zing.vn/api/streaming/audio/ZWBUA8B8/320',
              listAuthor: [
                AuthorModel(id: 'binz', name: 'Binz')
              ],
              lenght: 201,
              isLocal: false
          )
        ]
    );
  }
}