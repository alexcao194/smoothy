import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smoothy/app/core/domain/entities/play_list_entity.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/core/error/failures.dart';
import 'package:smoothy/core/usecases/usecase.dart';


class GetPlayList extends UseCase<PlayListEntity, Params> {
  const GetPlayList({required this.repositories});
  final Repositories repositories;

  @override
  Future<Either<Failure, PlayListEntity>> call(Params params) async {
    return await repositories.getPlayList(params.id);
  }
}

class Params extends Equatable {
  const Params({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}