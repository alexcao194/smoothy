import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/domain/entities/play_list_entity.dart';
import 'package:smoothy/app/core/domain/usecases/get_play_list.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final GetPlayList getPlayList;
  DataBloc({required this.getPlayList}) : super(DataInitial()) {
    on<GetPlayListEvent>(_onGet);
  }

  FutureOr<void> _onGet(GetPlayListEvent event, Emitter<DataState> emit) async {
    emit(LoadingState());
    final result = await getPlayList.call(Params(id: event.id));
    result.fold(
      (failure) {
        emit(PlayListGetFail(error: failure.message));
      },
      (playList) {
        emit(PlayListGetSuccessful(playList: playList));
      }
    );
  }
}
