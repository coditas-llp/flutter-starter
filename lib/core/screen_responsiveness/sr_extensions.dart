import 'package:scaffold/core/screen_responsiveness/sr_utils.dart';

extension ResponsiveSizes on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * ScreenUtil().screenHeight / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * ScreenUtil().screenWidth / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  /// Already set to Text only use for other use
  double get sp => this * ScreenUtil().textScale;
}
