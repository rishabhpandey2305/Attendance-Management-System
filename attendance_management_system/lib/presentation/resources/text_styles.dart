import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';

class AppTextStyles {
  final description = GoogleFonts.leagueSpartan(
      fontSize: 18, color: colors.black, fontWeight: FontWeight.w500);

  final developerName = GoogleFonts.leagueSpartan(
    fontSize: sizes.jumboFontSize,
    fontWeight: FontWeight.w700,
    foreground: Paint()
      ..strokeWidth = 1.5
      ..color = colors.black,
  );

  final loginNameText = GoogleFonts.kalam(
    fontSize: 25,
    color: Colors.orange,
    fontWeight: FontWeight.w500,
  );

  final pageHeading = GoogleFonts.leagueSpartan(
    fontSize: 28,
    color: colors.black,
    // fontWeight: FontWeight.bold,
  );

  final regularText = GoogleFonts.leagueSpartan(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500);

  final regularTextblack = GoogleFonts.leagueSpartan(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500);

  final shortBio = GoogleFonts.leagueSpartan(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xFF3498db),
  );
}
