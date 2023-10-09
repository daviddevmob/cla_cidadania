import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle {
  static final title = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: CustomColors.textColor,
  );
  static final medium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomColors.textColor,
  );
  static final little = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: CustomColors.textColor,
  );
}
