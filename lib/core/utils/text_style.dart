import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(context,
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? modeTheme,
  );
}

TextStyle getBodyStyle(context,
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
  );
}

TextStyle getSmallStyle(context,
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
  );
}
