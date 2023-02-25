import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFe2e2e2),
    primaryColor: ColorsApp.instance.primary,
  );
}