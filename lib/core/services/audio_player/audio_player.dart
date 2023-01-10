import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';

abstract class AudioPlayer {
  const AudioPlayer();
  void play(SongEntity song);
  void playPause();
  void stop();
}

class AudioPlayerImpl extends AudioPlayer {
  final player = AssetsAudioPlayer();

  @override
  void play(SongEntity song) async {
    if(song.isLocal) {
      await player.open(
          Audio(song.audio)
      );
    } else {
      await player.open(
          Audio.network(song.audio),
      );
    }
  }

  @override
  void playPause() {
    player.playOrPause();
  }

  @override
  void stop() {
    player.stop();
  }

}