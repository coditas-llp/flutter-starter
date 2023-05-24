import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

/// this is the abstract class for all the use cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
