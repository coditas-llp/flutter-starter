import 'package:equatable/equatable.dart';

/// this should be returned every time any method encounters error
class Failure extends Equatable {
  final List<dynamic> propss;
  final String? msg;

  const Failure({this.msg, this.propss = const []});

  @override
  List<Object?> get props => [propss];
}

class InternetFailure extends Failure {
  const InternetFailure({super.msg, super.propss});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.msg, super.propss});
}

class LocalDbFailure extends Failure {
  const LocalDbFailure({super.msg, super.propss});
}

class OnlineFailure extends Failure {
  const OnlineFailure({super.msg, super.propss});
}
