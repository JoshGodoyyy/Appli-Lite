import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFf6f7f9),
    primaryColor: ColorsApp.instance.primary,
    useMaterial3: true,
  );
}
