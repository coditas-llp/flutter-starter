import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:scaffold/core/errors/exceptions.dart';
import 'package:scaffold/features/myFeatureName/data/model/my_model.dart';

import '../../../../core/api_helper/base_api_helper.dart';

abstract class MyOnlineDataSource {
  /// this will throw exception it will not handle it
  Future<MyEntityModel> getEntity(int id);

  /// this will throw exception it will not handle it
  Future<List<MyEntityModel>> getEntityList();
}

class MyOnlineDataSourceImpl implements MyOnlineDataSource {
  @override
  Future<MyEntityModel> getEntity(int id) async {
    try {
      dynamic response = await BaseApiHelper().get("entityDetails");
      List<Map<String, dynamic>>? maps = jsonDecode(response);

      if (maps != null && maps.isNotEmpty) {
        return MyEntityModel.fromJson(maps[0]);
      } else {
        throw ServerException();
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MyEntityModel>> getEntityList() async {
    try {
      dynamic response = await BaseApiHelper().get("entityList");
      List<Map<String, dynamic>>? maps = jsonDecode(response);

      if (maps != null && maps.isNotEmpty) {
        return List.generate(
            maps.length, (index) => MyEntityModel.fromJson(maps[index]));
      } else {
        throw ServerException();
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
