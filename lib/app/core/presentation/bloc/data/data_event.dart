part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class GetPlayListEvent extends DataEvent {
  const GetPlayListEvent({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}