// This is our global ServiceLocator
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold/features/myFeatureName/data/datasource/my_local_data_source.dart';
import 'package:scaffold/features/myFeatureName/data/datasource/my_online_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'core/db_helper/database_helper.dart';
import 'core/platform/network_info.dart';
import 'features/myFeatureName/data/repositories/my_repository_impl.dart';
import 'features/myFeatureName/domain/repositories/my_repository.dart';
import 'features/myFeatureName/domain/usecases/my_use_case.dart';
import 'features/myFeatureName/presentation/bloc/my_bloc.dart';
import 'features/myFeatureName/presentation/bloc/my_bloc_states.dart';
import 'dart:math';

GetIt getIt = GetIt.instance;

init() async {
  //Feature
  //External
  Database db = await DatabaseHelper().db;
  await SharedPreferences.getInstance();
  getIt.registerSingleton<Database>(
    db,
    // signalsReady: true
  );

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(
    sharedPreferences,
    // signalsReady: true
  );

  //data source
  getIt.registerSingleton<MyLocalDataSource>(
    MyLocalDataSourceImpl(),
    // signalsReady: true
  );
  getIt.registerSingleton<MyOnlineDataSource>(
    MyOnlineDataSourceImpl(),
    // signalsReady: true
  );
  //repo
  getIt.registerSingleton<MyRepo>(
    MyRepoImpl(
        networkInfo: NetworkInfo(),
        myLocalDataSource: getIt(),
        myOnlineDataSource: getIt()),
    // signalsReady: true
  );
//use cases
  getIt.registerSingleton<GetMyEntityUseCase>(GetMyEntityUseCase(getIt()));
  getIt.registerSingleton<GetMyListUseCase>(GetMyListUseCase(getIt()));
  //bloc
  getIt.registerFactory(() => MyBloc(InitState(), getIt(), getIt()),
      // instanceName: "myBlocHomePage"
  );
  // getIt.registerSingleton<MyBloc>(
  //   MyBloc(InitState(), getIt(), getIt()),
  // signalsReady: true
  // );
}
