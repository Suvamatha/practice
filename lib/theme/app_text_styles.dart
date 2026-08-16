import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppText {
  AppText._();

  static TextStyle heading({double size = 22, Color color = ink}) =>
      GoogleFonts.fraunces(fontSize: size, fontWeight: FontWeight.w500, color: color);

  static TextStyle price({double size = 19, Color color = ink}) =>
      GoogleFonts.fraunces(fontSize: size, fontWeight: FontWeight.w500, color: color);

  static TextStyle body({double size = 14, FontWeight weight = FontWeight.w400, Color color = ink}) =>
      GoogleFonts.inter(fontSize: size, fontWeight: weight, color: color);

  static TextStyle label({double size = 12, FontWeight weight = FontWeight.w500, Color color = inkMuted}) =>
      GoogleFonts.inter(fontSize: size, fontWeight: weight, color: color);
}