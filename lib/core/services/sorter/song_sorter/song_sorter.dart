import 'package:smoothy/app/core/data/models/play_list_model.dart';

abstract class SongSorter {
  PlaylistModel sort(PlaylistModel playlistModel);
}

class NoneSorter extends SongSorter {
  @override
  PlaylistModel sort(PlaylistModel playlistModel) {
    return playlistModel;
  }
}