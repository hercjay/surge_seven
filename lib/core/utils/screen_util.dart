import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil? _instance;
  static const double mobileScreen = 480;
  static const double tabletScreen = 840;
  static const double desktopScreen = 841;

  final BuildContext context;
  String type = 'mobile';
  double width = 0;
  double height = 0;

  getScreenType(double width) {
    if (width <= mobileScreen) {
      return 'mobile';
    } else if (width <= tabletScreen) {
      return 'tablet';
    } else {
      return 'desktop';
    }
  }

  ScreenUtil._(this.context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    type = getScreenType(width!);
  }

  static void init(BuildContext context) {
    //return a working instance or create and return it
    _instance = ScreenUtil._(context);
  }

  static ScreenUtil get instance {
    if (_instance == null) {
      throw Exception('You must call ScreenUtil.init(context) first');
    }
    return _instance!;
  }
}
