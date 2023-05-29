import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaffold/injection_container.dart';
import 'package:scaffold/rout_config.gr.dart';

import '../bloc/my_bloc.dart';

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
