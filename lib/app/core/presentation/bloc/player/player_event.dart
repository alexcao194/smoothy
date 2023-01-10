part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}

// PlayEvent is used for start a song
// while PlayPauseEvent is used for change state of player

class GetFromCacheEvent extends PlayerEvent {
  const GetFromCacheEvent();

  @override
  List<Object?> get props => [];
}

class PlayEvent extends PlayerEvent {
  const PlayEvent({required this.song, required this.currentIndex});
  final SongEntity song;
  final int currentIndex;
  @override
  List<Object?> get props => [song, currentIndex];
}

class PlayPauseEvent extends PlayerEvent {
  const PlayPauseEvent({required this.state});

  final PlayingState state;

  @override
  List<Object?> get props => [state];
}

class StopEvent extends PlayerEvent {
  const StopEvent();

  @override
  List<Object?> get props => [];
}

class SkipNextEvent extends PlayerEvent {
  const SkipNextEvent({required this.nextSong, required this.currentIndex});

  final SongEntity? nextSong;
  final int currentIndex;

  @override
  List<Object?> get props => [nextSong, currentIndex];
}

class SkipPreviousEvent extends PlayerEvent {
  const SkipPreviousEvent({required this.previousSong, required this.currentIndex});

  final SongEntity? previousSong;
  final int currentIndex;

  @override
  List<Object?> get props => [previousSong, currentIndex];
}