import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/use_case/use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/my_entity.dart';
import '../repositories/my_repository.dart';

///
/// Use case 1 - get entity with id
///
/// this use cases will call get data from repo
/// and pass the data to the representation layer (bloc)
/// extend all your use case with [UseCase]

class GetMyEntityUseCase extends UseCase<MyEntity, int> {
  final MyRepo myRepo;

  GetMyEntityUseCase(this.myRepo);

  @override
  Future<Either<Failure, MyEntity>> call(int id) {
    /// write your business logic here
    /// if multiple params are required then create a different class named as [Params]
    return myRepo.getMyEntity(id);
  }
}

/// param class if multiple or no params are required
class Params extends Equatable {
  final int id;
  final String name;

  const Params(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}

///
/// Use case 2 - get list
///
class GetMyListUseCase {//extends UseCase<List<MyEntity>, NoParams> {
  final MyRepo myRepo;

  GetMyListUseCase(this.myRepo);

  Future<Either<Failure, List<MyEntity>>> call() {
    /// write your business logic here
    /// if multiple params are required then create a different class named as [Params]
    return myRepo.getMyEntityList();
  }
}
