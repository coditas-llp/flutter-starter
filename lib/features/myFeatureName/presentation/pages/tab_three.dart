import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/rout_config.gr.dart';

@RoutePage()
class TabThreeScreen extends StatelessWidget {
  /// Constructs a [TabTwo]
  final String title;

  const TabThreeScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAB THREE')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.router.push(TabOneRoute(title: "title")),
              child: const Text('TAB ONE'),
            )
          ],
        ),
      ),
    );
  }
}
