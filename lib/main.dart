import 'package:flutter/material.dart';

import 'app/core/pages/login_page.dart';
import 'app/core/ui/theme/theme_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeConfig.theme,
    );
  }
}
