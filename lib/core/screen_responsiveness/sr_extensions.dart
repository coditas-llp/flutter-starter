import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scaffold/core/screen_responsiveness/sr_utils.dart';

extension ResponsiveSizes on num{

  ///[ScreenUtil.setWidth]
  double get w => ScreenUtil().setWidth(this);

  ///[ScreenUtil.setHeight]
  double get h => ScreenUtil().setHeight(this);

  ///[ScreenUtil.radius]
  double get r => ScreenUtil().radius(this);

  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => min(toDouble(), sp);

  @Deprecated('use spMin instead')
  double get sm => min(toDouble(), sp);

  double get spMax => max(toDouble(), sp);

  ///Multiple of screen width
  double get sw => ScreenUtil().screenWidth * this;

  ///Multiple of screen height
  double get sh => ScreenUtil().screenHeight * this;

}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
    top: top.r,
    bottom: bottom.r,
    right: right.r,
    left: left.r,
  );

  EdgeInsets get w => copyWith(
    top: top.w,
    bottom: bottom.w,
    right: right.w,
    left: left.w,
  );

  EdgeInsets get h => copyWith(
    top: top.h,
    bottom: bottom.h,
    right: right.h,
    left: left.h,
  );
}
