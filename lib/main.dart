import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Pages/Home/home_page.dart';
import 'package:ai_health_assistance/Routing/app_routes.dart';
import 'package:ai_health_assistance/Services/BindingService/bindings.dart';
import 'package:ai_health_assistance/Services/CachingService/language_preferance_cache.dart';
import 'package:ai_health_assistance/Theme/theme_provider.dart';
import 'package:ai_health_assistance/Utils/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        initialBinding: BindingService(),
        scrollBehavior: const ScrollBehaviorModified(),
        getPages: AppRoutes.allRoutes,
        locale: const Locale("en", "En"),
        fallbackLocale: const Locale("en", "En"),
        debugShowCheckedModeBanner: false,
        translations: LocalizationHelper(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        home: HomePage(),
      ),
    );
  }
}
