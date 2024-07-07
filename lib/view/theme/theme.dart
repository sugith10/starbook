import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color/app_color.dart';

/* Light theme default */
AppColors appColor = AppColorsLight();
ThemeData appTheme = getLightTheme();

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFF141F23),
    colorScheme: const ColorScheme.light(
      surface: Color.fromRGBO(255, 255, 255, 1),
    ),
    applyElevationOverlayColor: false,
    dividerColor: const Color(0xFFECEDF1),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: appColor.screenBG,
     iconTheme: IconThemeData(
      color: appColor.textColor,
     ),
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.outfit(
        textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: appColor.textColor),
      ),
      headlineLarge: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 22.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      headlineMedium: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 20.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 18.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      labelLarge: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 16.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      labelMedium: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 14.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.w500)),
      labelSmall: GoogleFonts.outfit(
        textStyle: TextStyle(
          fontSize: 12.sp,
          color: appColor.textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodySmall: const TextStyle(
        color: Color.fromARGB(255, 122, 122, 122),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: appColor.textColor,
      suffixIconColor: appColor.textColor,
      hintStyle: TextStyle(
        color: appColor.textColor,
      ),
      border: _outlineInputBorder,
      enabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      errorBorder: _outlineInputBorder,
      focusedErrorBorder: _outlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appColor.pleasantButtonBg,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(50.sp, 50.sp),
        maximumSize: Size(500.sp, 100.sp),
        animationDuration: const Duration(milliseconds: 200),
      ),
    ),
    iconTheme: IconThemeData(
      color: appColor.textColor,
    ),
  );
}

final _outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: appColor.appSide),
  borderRadius: BorderRadius.circular(10),
);

ThemeData getDarkTheme() {
  return ThemeData(
    applyElevationOverlayColor: true,
    dividerColor: const Color(0xFFECEDF1),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF246BFD),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.outfit(
        textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: appColor.textColor),
      ),
      headlineLarge: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 22.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      headlineMedium: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 20.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 18.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      labelLarge: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 16.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.bold)),
      labelMedium: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 14.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.w500)),
      labelSmall: GoogleFonts.outfit(
          textStyle: TextStyle(
              fontSize: 12.sp,
              color: appColor.textColor,
              fontWeight: FontWeight.w400)),
    ),
  );
}
