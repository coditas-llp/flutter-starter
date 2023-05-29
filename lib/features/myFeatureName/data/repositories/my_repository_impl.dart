import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scaffold/core/errors/failure.dart';
import 'package:scaffold/core/platform/network_info.dart';

import '../../domain/entities/my_entity.dart';
import '../../domain/repositories/my_repository.dart';
import '../datasource/my_local_data_source.dart';
import '../datasource/my_online_data_source.dart';
import '../model/my_model.dart';

/// datasource does not handle any exception it just throws it
/// /// repository handles all the exceptions thrown by the datasource
class MyRepoImpl implements MyRepo {
  final NetworkInfo networkInfo;
  final MyLocalDataSource myLocalDataSource;
  final MyOnlineDataSource myOnlineDataSource;

  MyRepoImpl(
      {required this.networkInfo,
      required this.myLocalDataSource,
      required this.myOnlineDataSource});

  @override
  Future<Either<Failure, MyEntity>> getMyEntity(int id) async {
    if (await networkInfo.isConnected) {
      try {
        MyEntityModel model = await myOnlineDataSource.getEntity(id);
        return Right(model);
      } catch (e) {
        debugPrint(e.toString());
        return Left(UnknownFailure());
      }
    } else {
      try {
        MyEntityModel model = await myLocalDataSource.getEntity(id);
        return Right(model);
      } catch (e) {
        debugPrint(e.toString());
        return Left(UnknownFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MyEntity>>> getMyEntityList() async {
    if (await networkInfo.isConnected) {
      try {
        List<MyEntityModel> list = await myOnlineDataSource.getEntityList();
        return Right(list);
      } catch (e) {
        debugPrint(e.toString());
        return Left(UnknownFailure());
      }
    } else {
      try {
        List<MyEntityModel> list = await myLocalDataSource.getEntityList();
        return Right(list);
      } catch (e) {
        debugPrint(e.toString());
        return Left(UnknownFailure());
      }
    }
  }
}
