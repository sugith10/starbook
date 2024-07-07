import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  final Color screenBG;
  final Color appBarBG;
  final Color progressCircleBg;
  final Color pleasantButtonBg;
  final Color pleasantButtonBgHover;
  final Color buttonTextColor;
  final Color negativeButtonBg;
  final Color negativeButtonBgHover;
  final Color buttonTextColorHover;
  final Color textColor;
  final Color linkTextColor;

  final Color tileBgColor;
  final Color tileBgColorHover;
  final Color tileTextColor;
  final Color tileTextColorHover;

  final InputBorder textInputEnabledBorder;
  final InputBorder textInputFocusedBorder;
  final Color textInputFillColor;
  final TextStyle textInputStyle;
  final TextStyle textInputLabelStyle;
  final TextStyle pleasantButtonTextStyle;
  final TextStyle appBarTextStyle;
  final Color listDividerColor;
  final IconThemeData appBarIconTheme;
  final double appBarElevation;
  final Color primaryColor;
  final Color disableBgColor;
  final Color sideMenuHighlight;
  final Color appSide;
  final Color sideMenuDisable;
  final Color sideMenuBg;
  final Color inputBgFill;
  final List<Color> rainbowColors;

  AppColors(
      {required this.screenBG,
      required this.appBarBG,
      required this.progressCircleBg,
      required this.pleasantButtonBg,
      required this.negativeButtonBg,
      required this.buttonTextColor,
      required this.buttonTextColorHover,
      required this.pleasantButtonBgHover,
      required this.negativeButtonBgHover,
      required this.textColor,
      required this.textInputEnabledBorder,
      required this.textInputFocusedBorder,
      required this.textInputFillColor,
      required this.textInputStyle,
      required this.textInputLabelStyle,
      required this.pleasantButtonTextStyle,
      required this.appBarTextStyle,
      required this.listDividerColor,
      required this.appBarIconTheme,
      required this.appBarElevation,
      required this.primaryColor,
      required this.disableBgColor,
      required this.sideMenuHighlight,
      required this.appSide,
      required this.sideMenuDisable,
      required this.sideMenuBg,
      required this.inputBgFill,
      required this.rainbowColors,
      required this.linkTextColor,
      required this.tileBgColor,
      required this.tileBgColorHover,
      required this.tileTextColor,
      required this.tileTextColorHover});
}

class AppColorsLight extends AppColors {
  AppColorsLight()
      : super(
          screenBG: const Color(0xFF141F23),
          appBarBG: const Color(0xFF141F23),
          progressCircleBg: Colors.black,
          pleasantButtonBg: const Color(0xFF93D334),
          pleasantButtonBgHover: const Color.fromRGBO(2, 67, 199, 1.0),
          negativeButtonBg: const Color.fromARGB(255, 248, 53, 95),
          negativeButtonBgHover: const Color.fromARGB(255, 255, 42, 42),
          buttonTextColor: const Color.fromRGBO(255, 255, 255, 1),
          buttonTextColorHover: const Color.fromRGBO(200, 200, 200, 1),
          textColor: const Color.fromARGB(255, 255, 255, 255),
          textInputEnabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey[200] ?? Colors.grey,
            ),
          ),
          textInputFocusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey[300] ?? Colors.grey,
            ),
          ),
          textInputFillColor: Colors.grey[100] ?? Colors.grey,
          textInputStyle: const TextStyle(color: Colors.black87),
          textInputLabelStyle: const TextStyle(color: Colors.black87),
          pleasantButtonTextStyle: const TextStyle(color: Colors.white),
          appBarTextStyle: GoogleFonts.righteous(
              textStyle: const TextStyle(color: Colors.black)),
          listDividerColor: Colors.grey[400] ?? Colors.grey,
          appBarIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          appBarElevation: 8,
          primaryColor: const Color(0xFF93D334),
          disableBgColor: Colors.black54,
          sideMenuHighlight: Colors.black,
          appSide: const Color(0xFF38464F),
          sideMenuDisable: Colors.white24,
          sideMenuBg: const Color.fromARGB(255, 12, 16, 36),
          inputBgFill: const Color.fromRGBO(230, 230, 230, 1),
          rainbowColors: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.indigo,
            Colors.purple,
          ],
          linkTextColor: Colors.red,
          tileBgColor: Colors.white,
          tileBgColorHover: const Color.fromRGBO(2, 67, 199, 1.0),
          tileTextColor: Colors.black87,
          tileTextColorHover: Colors.white,
        );
}
