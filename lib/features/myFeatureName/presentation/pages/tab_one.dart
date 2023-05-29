import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/common_widgets/common_widgets.dart';
import '../../../../core/constants/dimen.dart';
import '../../../../core/multilingual/app_locale.dart';
import '../../../../rout_config.gr.dart';

@RoutePage()
class TabOneScreen extends StatelessWidget {
  /// Constructs a [TabOne]
  final String title;

  const TabOneScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAB TWO')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(AppLocale.title),
            Text(AppLocale.title.getString(context)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  child:  Text('English $padding'),
                  onPressed: () {
                    FlutterLocalization.instance.translate('en');
                  },
                ),
                width(),
                ElevatedButton(
                  child: const Text('Cambodian'),
                  onPressed: () {
                    FlutterLocalization.instance.translate('km');
                  },
                ),
                width(),
                ElevatedButton(
                  child: const Text('Japanese'),
                  onPressed: () {
                    FlutterLocalization.instance.translate('ja');
                  },
                ),
              ],
            ),
            height(),
            ElevatedButton(
              onPressed: () => context.router.push(TabTwoRoute(title: "title")),
              child: const Text('TAB TWO'),
            ),
          ],
        ),
      ),
    );
  }
}
