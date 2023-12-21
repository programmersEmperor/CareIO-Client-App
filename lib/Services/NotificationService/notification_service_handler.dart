import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NotificationServiceHandler {
  static late FirebaseMessaging messaging;

  static void initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    messaging = FirebaseMessaging.instance;
    Get.find<UserSession>().firebaseDeviceToken =
        await messaging.getToken() ?? "";
  }
}
