/*
 * Created by 李卓原 on 2018/9/29.
 * email: zhuoyuan93@gmail.com
 */

import 'dart:async' show Completer;
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import '../constants/dimen.dart';

bool isInit = false;

sRInit(BuildContext context) async {
  if (isInit) {
    return;
  }
  isInit = true;
  AppStyle appStyle = AppStyle(screenSize: MediaQuery.of(context).size);

  Size originalSize = MediaQuery.of(context).size;
  await ScreenUtil.init(originalSize, appStyle.scale);
}

class ScreenUtil {
  static final ScreenUtil _instance = ScreenUtil._();

  late double _screenWidth;
  late double _screenHeight;
  late double _textScale;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  /// Initializing the library.
  static Future<void> init(Size originalSize, double textScale) async {
    final initCompleter = Completer<void>();

    _instance
      .._textScale = textScale
      .._screenWidth = originalSize.width
      .._screenHeight = originalSize.height;
    padding = padding * textScale;
    return initCompleter.future;
  }

  /// The horizontal extent of this size.
  double get screenWidth => _screenWidth;

  ///The vertical extent of this size. dp
  double get screenHeight => _screenHeight;

  ///The text scale as per the screen size
  double get textScale => _textScale;
}

@immutable
class AppStyle {
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    const phoneMd = 360;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1.10; //1
    } else if (shortestSide > phoneLg) {
      scale = 1; // phone
    } else if (shortestSide > phoneMd) {
      scale = .9; // phone
    } else {
      scale = .85; // small phone
    }
    //debugPrint('screenSize=$screenSize, scale=$scale');
  }

  late final double scale;
}
