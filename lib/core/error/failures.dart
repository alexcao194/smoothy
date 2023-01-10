import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class NotFoundSongServerFailure extends Failure {
  const NotFoundSongServerFailure() : super(
    message: "There is no song with this id in server"
  );
}

class InternalServerFailure extends Failure {
  const InternalServerFailure() : super(
    message: "The server is under maintenance "
  );
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(
    message: "No internet, please connect and try again"
  );
}

class LocalFailure extends Failure {
  const LocalFailure() : super(
    message: "Local data error"
  );
}

class InternalFailure extends Failure {
  const InternalFailure() : super(
    message: "There has been an error from the system, contact the administrator"
  );
}