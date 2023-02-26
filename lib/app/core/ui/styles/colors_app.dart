import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff473e97);
  Color get lightBlue => const Color(0xff71b8ff);
  Color get lightOrange => const Color(0xFFffaa5b);
  Color get orange => const Color(0xFFff5606);
  Color get pink => const Color(0xFFe91e63);
  Color get purple => const Color(0xFF9ba0fc);
  Color get deepBlue => const Color(0xff3366ff);
}