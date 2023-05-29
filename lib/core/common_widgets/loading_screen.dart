import 'package:flutter/material.dart';

import '../constants/dimen.dart';
import 'common_widgets.dart';

class LoadingContainer extends StatelessWidget {
  final String msg;

  const LoadingContainer({this.msg = "Please wait...", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          Text(msg, style: Theme.of(context).textTheme.labelLarge),
          width(),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
