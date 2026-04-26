import 'package:flutter/widgets.dart';

class ResponsiveConfig {
  const ResponsiveConfig({this.baseWidth = 390, this.baseHeight = 844});

  final double baseWidth;
  final double baseHeight;
}

const responsiveConfig = ResponsiveConfig();

extension ResponsiveContextX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get _scaleWidth => screenSize.width / responsiveConfig.baseWidth;
  double get _scaleHeight => screenSize.height / responsiveConfig.baseHeight;

  double get scaleFactor {
    final scale = _scaleWidth < _scaleHeight ? _scaleWidth : _scaleHeight;
    return scale.clamp(0.85, 1.25);
  }

  double w(double value) => value * _scaleWidth;
  double h(double value) => value * _scaleHeight;
  double sp(double value) => value * scaleFactor;
  double r(double value) => value * scaleFactor;
}
