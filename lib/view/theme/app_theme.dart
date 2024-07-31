import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_book/view/color/app_color.dart';

import '../const/app_radius.dart';

class AppTheme {
  final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColor.bg,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    primaryColor: AppColor.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.textPrimary),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppRadius.borderRadius)),
            borderSide: BorderSide(width: 2)),
        disabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppRadius.borderRadius)),
            borderSide: BorderSide(width: 2)),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppRadius.borderRadius), ),
              
          borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 0, 94, 255), ),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppRadius.borderRadius), ),
          borderSide: BorderSide(width: 2, 
            
          )
        )),
  );
}
