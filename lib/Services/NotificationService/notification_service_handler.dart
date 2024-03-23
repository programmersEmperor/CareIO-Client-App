import 'dart:math';

import 'package:ai_health_assistance/Pages/Home/controller/appointment_controller.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Utils/appointment_enum.dart';
import 'package:ai_health_assistance/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

abstract class NotificationServiceHandler {
  static late FirebaseMessaging messaging;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    messaging = FirebaseMessaging.instance;
    Get.put(UserSession(), permanent: true);
    Get.find<UserSession>().firebaseDeviceToken =
        await messaging.getToken() ?? "";

    if (await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission() ??
        false) {
      _configureLocalNotifications();
    }
  }

  static Future<void> _configureLocalNotifications() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings('@drawable/careio_launcher');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) async {

      },
    );
    _configureFirebaseMessaging();
  }

  static void _configureFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((event) {
      Get.find<AppointmentController>().initializeAppointments(status: AppointmentTypes.upcoming);
      showLocalNotification(event.notification!.toMap());
    });
  }

  static void showLocalNotification(Map<String, dynamic> message) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'all-notifications-channel',
      'all-notifications',
      channelDescription: 'all-notifications-description',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@drawable/careio_launcher',
      largeIcon: DrawableResourceAndroidBitmap('@drawable/careio_launcher'),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    Random random = Random();
    int uniqueId = random.nextInt(999999);

    await flutterLocalNotificationsPlugin.show(
      uniqueId, // Notification ID
      message['title'], // Notification title
      message['body'], // Notification body
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }
}
