import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff473e97);
  
  /* 
   * light blue = Color(0xFF71b8ff);
   * light orange = Color(0xFFffaa5b);
   * orange = Color(0xFFff5606);
   * pink = Color(0xFFe91e63);
   * purple = Color(0xFF9ba0fc);
   * deep blue = Color(0xff3366ff);
   */

}