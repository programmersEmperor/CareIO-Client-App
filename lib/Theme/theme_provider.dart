import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

abstract class ThemeProvider {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xffF0F0F0),
        primaryColor: const Color(0xff302ac2),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(splashFactory: NoSplash.splashFactory)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff302ac2),
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStatePropertyAll(
            Colors.transparent,
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black54),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
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
