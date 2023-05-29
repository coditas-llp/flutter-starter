import 'package:flutter/material.dart';
import 'package:scaffold/core/constants/dimen.dart';

class ErrorContainer extends StatelessWidget {
  final String msg;

  const ErrorContainer({this.msg = "Something went wrong", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: Text(
        msg,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
