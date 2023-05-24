import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaffold/core/platform/network_info.dart';
import 'package:scaffold/features/myFeatureName/data/datasource/my_local_data_source.dart';
import 'package:scaffold/features/myFeatureName/data/datasource/my_online_data_source.dart';
import 'package:scaffold/features/myFeatureName/data/repositories/my_repository_impl.dart';
import 'package:scaffold/features/myFeatureName/domain/repositories/my_repository.dart';
import 'package:scaffold/features/myFeatureName/domain/usecases/my_use_case.dart';
import 'package:scaffold/injection_container.dart';

import '../../../../core/constants/dimen.dart';
import '../bloc/my_bloc.dart';
import '../bloc/my_bloc_states.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<MyBloc>(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(padding),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
