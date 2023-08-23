import 'package:ai_health_assistance/Pages/OnBoarding/onboarding_page.dart';
import 'package:ai_health_assistance/Theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'Health Ai Assistance',
        theme: ThemeProvider.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const OnBoardingPage(),
      ),
    );
  }
}
