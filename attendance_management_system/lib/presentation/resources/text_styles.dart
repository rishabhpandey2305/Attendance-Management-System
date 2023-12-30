import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';

class AppTextStyles {
  final developerName = GoogleFonts.leagueSpartan(
    fontSize: sizes.jumboFontSize,
    fontWeight: FontWeight.w700,
    foreground: Paint()
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = colors.black,
  );

  final shortBio = GoogleFonts.leagueSpartan(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  final pageHeading = GoogleFonts.leagueSpartan(
    fontSize: 32,
    color: colors.white,
    fontWeight: FontWeight.bold,
  );
  final description = GoogleFonts.leagueSpartan(
      fontSize: 18, color: colors.black, fontWeight: FontWeight.w500);

  final regularText = GoogleFonts.leagueSpartan(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
  final loginNameText = GoogleFonts.kalam(
    fontSize: 25,
    color: Colors.orange,
    fontWeight: FontWeight.w500,
  );
}
