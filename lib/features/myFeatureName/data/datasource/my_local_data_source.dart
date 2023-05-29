import 'package:flutter/cupertino.dart';
import 'package:scaffold/core/db_helper/table_structures.dart';

import '../../../../core/db_helper/database_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/my_model.dart';

abstract class MyLocalDataSource {
  /// this will throw exception it will not handle it
  Future<MyEntityModel> getEntity(int id);

  /// this will throw exception it will not handle it
  Future<List<MyEntityModel>> getEntityList();
}

class MyLocalDataSourceImpl implements MyLocalDataSource {
  @override
  Future<MyEntityModel> getEntity(int id) async {
    try {
      List<Map<String, dynamic>>? maps = await DatabaseHelper.getData(
          transaction1,
          whClause: "where localId = $id");
      if (maps != null && maps.isNotEmpty) {
        return MyEntityModel.fromJson(maps[0]);
      } else {
        throw LocalDbException();
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MyEntityModel>> getEntityList() async {
    try {
      List<Map<String, dynamic>>? maps =
          await DatabaseHelper.getData(transaction1);
      if (maps != null && maps.isNotEmpty) {
        return List.generate(
            maps.length, (index) => MyEntityModel.fromJson(maps[index]));
      } else {
        throw LocalDbException();
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
