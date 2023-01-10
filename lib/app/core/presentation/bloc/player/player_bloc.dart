import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/data/models/author_model.dart';
import 'package:smoothy/app/core/data/models/song_model.dart';
import 'package:smoothy/app/core/domain/entities/song_entity.dart';
import 'package:smoothy/app/core/domain/usecases/cache_song.dart';
import 'package:smoothy/app/core/domain/usecases/get_song_from_cache.dart';
import 'package:smoothy/core/services/audio_player/audio_player.dart';
import 'package:smoothy/core/usecases/usecase.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, MPlayerState> {
  PlayerBloc({
    required this.audioPlayer,
    required this.getSongFromCache,
    required this.cacheSong
  }) : super(PlayerInitial()) {
    on<PlayEvent>(_onPlay);
    on<PlayPauseEvent>(_onPlayPause);
    on<StopEvent>(_onStop);
    on<GetFromCacheEvent>(_onGet);
    on<SkipNextEvent>(_onSkipNext);
    on<SkipPreviousEvent>(_onSkipPrevious);
  }
  final AudioPlayer audioPlayer;
  final GetSongFromCache getSongFromCache;
  final CacheSong cacheSong;

  FutureOr<void> _onPlay(PlayEvent event, Emitter<MPlayerState> emit) async {
    audioPlayer.play(event.song);
    emit(PlayingState(song: event.song, currentIndex: event.currentIndex, isCache: false));
    await cacheSong.call(Params(songModel: SongModel(
      id: event.song.id,
      audio: event.song.audio,
      listAuthor: List<AuthorModel>.from(event.song.author),
      cover: event.song.cover,
      isLocal: event.song.isLocal,
      name: event.song.name,
      lenght: event.song.lenght
    )));
  }

  FutureOr<void> _onPlayPause(PlayPauseEvent event, Emitter<MPlayerState> emit) {
    if(event.state.isCache) {
      add(PlayEvent(song: event.state.song, currentIndex: -1));
    } else {
      audioPlayer.playPause();
    }
  }

  FutureOr<void> _onStop(StopEvent event, Emitter<MPlayerState> emit) {
    audioPlayer.stop();
    emit(PlayerInitial());
  }

  FutureOr<void> _onGet(GetFromCacheEvent event, Emitter<MPlayerState> emit) async {
    final result = await getSongFromCache.call(NoParams());
    result.fold(
      (failure) {
        emit(PlayerInitial());
      },
      (song) {
        emit(PlayingState(song: song, currentIndex: -1, isCache: true));
      }
    );
  }

  FutureOr<void> _onSkipNext(SkipNextEvent event, Emitter<MPlayerState> emit) {
    if(event.nextSong != null) {
      add(PlayEvent(song: event.nextSong!, currentIndex: event.currentIndex + 1));
    } else {
      print("error");
      // TODO : hanlde show noti
    }
  }

  FutureOr<void> _onSkipPrevious(SkipPreviousEvent event, Emitter<MPlayerState> emit) {
    if(event.previousSong != null) {
      add(PlayEvent(song: event.previousSong!, currentIndex: event.currentIndex - 1));
    } else {
      print("error");
      // TODO : hanlde show noti
    }
  }
}
