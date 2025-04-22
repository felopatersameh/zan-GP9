import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  //*  Main Colors
  static const Color primaryColor = Color(0xFFFD6B22);
  static const Color primaryColorDark = Color(0xFF8A3005);
  static const Color backgroundColor = Colors.white;
  static const Color secondaryColor = Color(0xFF110C1D);

  //*for Text
  static const Color textColorBlack = secondaryColor;
  static const Color textColorWhite = Colors.white;

  //* Alerts Colors
  static const Color success = Color(0xFF66CB63);
  static const Color error = Color(0xFFF41F52);
  static const Color warning = Color(0xFFFFCD1A);

  //* Additional Colors
  static const Color greyLight = Color(0xFFF8FCF8);
  static const Color line = Color(0xFFE9EBED);
  static const Color lineDark = Color(0xFF282837);
  static const Color star = CupertinoColors.activeOrange;

  //* Grayscale Color
  static const Color grayscale10 = Color(0xFFF4F5F6);
  static const Color grayscale20 = Color(0xFFECF1F6);
  static const Color grayscale30 = Color(0xFFE3E9ED);
  static const Color grayscale40 = Color(0xFFD1D8DD);
  static const Color grayscale50 = Color(0xFFBFC8CC);
  static const Color grayscale60 = Color(0xFF9CA4AB);
  static const Color grayscale70 = Color(0xFF78828A);
  static const Color grayscale80 = Color(0xFF66707A);
  static const Color grayscale90 = Color(0xFF434E58);
  static const Color grayscale100 = Color(0xFF171725);


  //* Gradient Colors Background
    static List<Color> gradientColors = [
    Color(0xFF0E0F10),
    Color(0xFF222426),
    Color(0xFF151617),
    Color(0xFF1C1D1E),
    Color(0xFF44474B),
    Color(0xFF292B2D),
    Color(0xFF303236),
    Color(0xFF1C1D1E),
    Color(0xFF44474B),
    Color(0xFF292B2D),
    Color(0xFF303236),
  ];

  //* list of colors for dashboard
  static const Color dashboardColor1 = Color.fromRGBO(162, 200, 254 ,1);
  static const Color dashboardColor2 = Color.fromRGBO(25, 135, 84 ,1);  
  static const Color dashboardColor3 = Color.fromRGBO(13, 202, 240 ,1);
  static const Color dashboardColor4 = Color.fromRGBO(255, 193, 7 ,1);
  
}
