import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/rout_config.gr.dart';

import 'home_page.dart';

@RoutePage()
class TabTwoScreen extends StatelessWidget {
  /// Constructs a [TabThree]
  String title;

  TabTwoScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAB THREE')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.router.push(TabThreeRoute(title: "title")),
              child: const Text('TAB THREE'),
            )
          ],
        ),
      ),
    );
  }
}
