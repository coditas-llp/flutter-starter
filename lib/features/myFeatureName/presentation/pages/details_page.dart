import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/screen_responsiveness/sr_extensions.dart';

import '../../../../core/common_widgets/common_widgets.dart';
import '../../../../core/constants/dimen.dart';
import '../bloc/my_bloc.dart';
import '../bloc/my_bloc_events.dart';
import '../bloc/my_bloc_states.dart';
import '../widgets/entity_list.dart';
import '../widgets/single_entity.dart';

/// The details screen
@RoutePage()
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  final String title;

  const DetailsScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Details Screen')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(padding),
          child: BlocBuilder<MyBloc, MyStates>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state is ShowData)
                    SingleEntity(state.model)
                  else if (state is ShowListData)
                    Expanded(child: EntityList(state.list))
                  else if (state is LoadingState)
                    Text(state.msg)
                  else
                    Container(
                      padding: EdgeInsets.all(padding),
                      child: const Text("Tap below buttons to view data"),
                    ),
                  height(),
                  Text(
                    'Some sample text 10.w',
                    style: TextStyle(fontSize: 10.w),
                  ),
                  height(),
                  const Text(
                    'Some sample text 20',
                    style: TextStyle(fontSize: 20),
                  ),
                  height(),
                  const Text(
                    'Some sample text textScaleFactor 1',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  height(),
                  Text(
                      'textScaleFactor ${MediaQuery.of(context).textScaleFactor}',
                      style: const TextStyle(fontSize: 20)),
                  Text('padding $padding',
                      style: const TextStyle(fontSize: 20)),
                  height(),
                  Text(
                      'devicePixelRatio ${MediaQuery.of(context).devicePixelRatio}',
                      style: const TextStyle(fontSize: 20)),
                  height(),
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
        ),
      ),
    );
  }
}
