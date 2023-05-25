import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaffold/core/platform/network_info.dart';
import 'package:scaffold/core/utility/common_widgets.dart';
import 'package:scaffold/features/myFeatureName/data/datasource/my_local_data_source.dart';
import 'package:scaffold/features/myFeatureName/data/datasource/my_online_data_source.dart';
import 'package:scaffold/features/myFeatureName/data/repositories/my_repository_impl.dart';
import 'package:scaffold/features/myFeatureName/domain/repositories/my_repository.dart';
import 'package:scaffold/features/myFeatureName/domain/usecases/my_use_case.dart';
import 'package:scaffold/features/myFeatureName/presentation/pages/tab_one.dart';
import 'package:scaffold/features/myFeatureName/presentation/pages/tab_three.dart';
import 'package:scaffold/features/myFeatureName/presentation/pages/tab_two.dart';
import 'package:scaffold/injection_container.dart';
import 'package:scaffold/rout_config.gr.dart';

import '../../../../core/constants/dimen.dart';
import '../bloc/my_bloc.dart';
import '../bloc/my_bloc_states.dart';
import 'details_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

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
        child: AutoTabsRouter.pageView(
            routes: [
              DetailsRoute(title: ''),
              TabOneRoute(title: "One"),
              TabTwoRoute(title: "Two"),
              TabThreeRoute(title: "Three"),
            ],
            builder: (context, child, _) {
              final tabsRouter = AutoTabsRouter.of(context);
              return Scaffold(
                body: child, //getPage(),
                bottomNavigationBar: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: "Explore"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.update), label: "Updates"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.sms), label: "Chat"),
                    ],
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex),
              );
            }));
  }
}
