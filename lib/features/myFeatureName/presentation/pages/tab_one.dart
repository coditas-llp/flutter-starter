import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/rout_config.gr.dart';

import 'home_page.dart';

@RoutePage()
class TabOneScreen extends StatelessWidget {
  /// Constructs a [TabOne]
  String title;

  TabOneScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAB TWO')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.router.push(TabTwoRoute(title: "title")),
              child: const Text('TAB TWO'),
            )
          ],
        ),
      ),
    );
  }
}
