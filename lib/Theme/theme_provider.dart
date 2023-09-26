import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeProvider {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xffF6F7F7),
        primaryColor: const Color(0xff129A7F),
        cardColor: const Color(0xffE7F5F2),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        textTheme: GoogleFonts.rubikTextTheme().copyWith(),
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(splashFactory: NoSplash.splashFactory)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff129A7F),
        ),
        tabBarTheme: const TabBarTheme(
          overlayColor: MaterialStatePropertyAll(
            Colors.transparent,
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black54),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      );
}
