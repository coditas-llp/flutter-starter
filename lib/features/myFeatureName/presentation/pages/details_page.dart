import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaffold/features/myFeatureName/presentation/bloc/my_bloc.dart';
import 'package:scaffold/features/myFeatureName/presentation/bloc/my_bloc_states.dart';
import 'package:scaffold/rout_config.gr.dart';

import '../../../../core/constants/dimen.dart';
import '../../../../core/utility/common_widgets.dart';
import '../bloc/my_bloc_events.dart';
import '../widgets/entity_list.dart';
import '../widgets/single_entity.dart';
import 'home_page.dart';

/// The details screen
@RoutePage()
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  String title;

  DetailsScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Details Screen')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(padding),
          child: BlocBuilder<MyBloc, MyStates>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (state is ShowData)
                    SingleEntity(state.model)
                  else if (state is ShowListData)
                    Expanded(child: EntityList(state.list))
                  else if (state is LoadingState)
                    Text(state.msg)
                  else
                    Container(
                      padding: const EdgeInsets.all(padding),
                      child: const Text("Tap below buttons to view data"),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<MyBloc>().add(FetchDataEvent(1));
                          },
                          child: const Text("Single Entity")),
                      width(),
                      ElevatedButton(
                          onPressed: () {
                            context.read<MyBloc>().add(FetchDataListEvent());
                          },
                          child: const Text("Entity List")),
                    ],
                  ),
                ],
              );
            },
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         ...buttons(context, ""),
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         ...buttons(context, "/R2"),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

List<ElevatedButton> buttons(BuildContext context, String route) => [
      ElevatedButton(
        // onPressed: () => context.router .push(const HomeRoute()),
        onPressed: () => context.router.pushNamed("/dashboard"),
        child: Text('$route A'),
      ),
      // ElevatedButton(
      //   onPressed: () => context.router .push('$route/A/A1'),
      //   child: Text('$route A1'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.router .go('$route/A/A2'),
      //   child: Text('$route A2'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.router .go('$route/B'),
      //   child: Text('$route B'),
      // ),
      // ElevatedButton(
      //   onPressed: () => context.router .go('$route/C'),
      //   child: Text('$route C'),
      // )
    ];
