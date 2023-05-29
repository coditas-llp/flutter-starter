import 'package:flutter/cupertino.dart';
import 'package:scaffold/core/constants/dimen.dart';

height({double? height}) => SizedBox(
      height: height ?? padding,
    );

width({double? width}) => SizedBox(
      width: width ?? padding,
    );
