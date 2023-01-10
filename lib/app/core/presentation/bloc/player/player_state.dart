part of 'player_bloc.dart';

abstract class MPlayerState extends Equatable {
  const MPlayerState();
}

class PlayerInitial extends MPlayerState {
  @override
  List<Object> get props => [];
}

class PlayingState extends MPlayerState {
  const PlayingState({required this.song, required this.currentIndex, required this.isCache});
  final SongEntity song;
  final int currentIndex;
  final bool isCache;
  @override
  List<Object?> get props => [song, currentIndex, isCache];
}