import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/rout_config.gr.dart';

@RoutePage()
class TabTwoScreen extends StatelessWidget {
  /// Constructs a [TabThree]
  final String title;

  const TabTwoScreen(this.title, {super.key});

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
