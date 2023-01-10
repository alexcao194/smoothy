part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {

}

class LoadingState extends DataState {

}

class PlayListGetSuccessful extends DataState {
  const PlayListGetSuccessful({required this.playList});
  final PlayListEntity playList;

  @override
  List<Object> get props => [playList];
}

class PlayListGetFail extends DataState {
  const PlayListGetFail({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}