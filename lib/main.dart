import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Pages/splash/splashPage.dart';
import 'package:ai_health_assistance/Routing/app_routes.dart';
import 'package:ai_health_assistance/Services/BindingService/bindings.dart';
import 'package:ai_health_assistance/Services/NotificationService/notification_service_handler.dart';
import 'package:ai_health_assistance/Theme/theme_provider.dart';
import 'package:ai_health_assistance/Utils/scroll_behavior.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationServiceHandler.showLocalNotification(
      message.notification!.toMap());
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  NotificationServiceHandler.initializeFirebase();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Hive.initFlutter();
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
        title: 'Health AI Assistance',
        theme: ThemeProvider.lightTheme,
        initialBinding: BindingService(),
        scrollBehavior: const ScrollBehaviorModified(),
        getPages: AppRoutes.allRoutes,
        fallbackLocale: const Locale("en", "US"),
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
