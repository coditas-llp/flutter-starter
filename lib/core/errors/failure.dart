import 'package:equatable/equatable.dart';

/// this should be returned every time any method encounters error
class Failure extends Equatable {
  final List<dynamic> propss;

  Failure([this.propss = const []]);

  @override
  List<Object?> get props => [propss];
}

class InternetFailure extends Failure {
  InternetFailure([super.propss]);
}

class UnknownFailure extends Failure {
  UnknownFailure([super.propss]);
}

class LocalDbFailure extends Failure {
  LocalDbFailure([super.propss]);
}

class OnlineFailure extends Failure {
  OnlineFailure([super.propss]);
}
