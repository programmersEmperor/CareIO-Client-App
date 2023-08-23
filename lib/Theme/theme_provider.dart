import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

abstract class ThemeProvider {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xffF0F0F0),
        primaryColor: const Color(0xff302ac2),
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: TextStyle(fontSize: 16.sp, color: Colors.grey),
          titleLarge: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
