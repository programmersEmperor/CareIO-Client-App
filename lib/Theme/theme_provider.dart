import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

abstract class ThemeProvider {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xffF0F0F0),
        primaryColor: const Color(0xff302ac2),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff302ac2),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: GoogleFonts.rubikTextTheme().copyWith(
          bodyLarge: TextStyle(fontSize: 16.sp, color: Colors.grey),
          titleLarge: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
