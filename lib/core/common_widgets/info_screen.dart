import 'package:flutter/material.dart';
import 'package:scaffold/core/constants/dimen.dart';

class InfoContainer extends StatelessWidget {
  final String msg;
  final Widget? widget;

  const InfoContainer(this.msg, {super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Text(msg, style: Theme.of(context).textTheme.labelLarge),
          widget!
        ],
      ),
    );
  }
}
