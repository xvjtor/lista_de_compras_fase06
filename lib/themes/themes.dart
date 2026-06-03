import 'package:app_lista_de_compras/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  const Color primaryColor = Colors.black;

  return ThemeData(
    brightness: Brightness.dark,
    extensions: [AppColors(primaryColor: primaryColor)],

    fontFamily: "Montserrat",

    colorScheme: const ColorScheme.dark(primary: primaryColor),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: CardThemeData(
      elevation: 5,

      color: Colors.green[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
    ),

    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: Colors.grey[900],
      border: InputBorder.none,
      labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.black54,
      actionsPadding: .symmetric(horizontal: 10),
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    dividerTheme: DividerThemeData(thickness: 2, color: Colors.grey),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey[900]),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.green,
        side: BorderSide(color: Colors.green),
      ),
    ),
  );
}

ThemeData lightTheme() {
  const Color primaryColor = Colors.green;
  return ThemeData(
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(primary: primaryColor),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardThemeData(
      elevation: 5,

      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
    ),
    extensions: [AppColors(primaryColor: primaryColor)],
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: Colors.white,
      border: InputBorder.none,
      labelStyle: TextStyle(color: Colors.grey[700], fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.black54,
      actionsPadding: .symmetric(horizontal: 10),
      centerTitle: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: Colors.grey[500],
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.green),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      titleMedium: const TextStyle(fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),

    dividerTheme: DividerThemeData(thickness: 2, color: Colors.black),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.white),
      ),
    ),
  );
}
