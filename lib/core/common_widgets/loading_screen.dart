import 'package:flutter/material.dart';
import 'package:scaffold/core/common_widgets/common_widgets.dart';
import 'package:scaffold/core/constants/dimen.dart';

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
