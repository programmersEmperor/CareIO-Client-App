import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Pages/splash/splashPage.dart';
import 'package:ai_health_assistance/Routing/app_routes.dart';
import 'package:ai_health_assistance/Services/BindingService/bindings.dart';
import 'package:ai_health_assistance/Services/NotificationService/notification_service_handler.dart';
import 'package:ai_health_assistance/Theme/theme_provider.dart';
import 'package:ai_health_assistance/Utils/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  NotificationServiceHandler.initializeFirebase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          GetMaterialApp(
        title: 'Health Ai Assistance',
        theme: ThemeProvider.lightTheme,
        initialBinding: BindingService(),
        scrollBehavior: const ScrollBehaviorModified(),
        getPages: AppRoutes.allRoutes,
        locale: const Locale("en", "EN"),
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
        home: const SplashPage(),
      ),
    );
  }
}
