import 'package:dartz/dartz.dart';
import '../../domain/entities/my_entity.dart';

import '../../../../core/errors/failure.dart';

/// create a abstract structure for the repo
/// data layer will have the implementation of this repo
abstract class MyRepo {
  Future<Either<Failure, MyEntity>> getMyEntity(int id);
  Future<Either<Failure, List<MyEntity>>> getMyEntityList();
}
