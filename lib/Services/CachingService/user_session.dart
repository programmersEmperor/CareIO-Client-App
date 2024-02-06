import 'dart:convert';

import 'package:ai_health_assistance/Localization/localization_helper.dart';
import 'package:ai_health_assistance/Models/Wallet.dart';
import 'package:ai_health_assistance/Models/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class UserSession {
  static const _patientBox = 'patientBox';
  static const _patientKey = 'patientKey';
  static const _tokenKey = 'tokenKey';
  static const _localeKey = 'localeKey';
  static const _openedChatKey = 'openedChatKey';
  String firebaseDeviceToken = '';

  String token = '';
  late Patient patient;
  List<Wallet> wallets = [];
  late Box box;
  bool userOpenedChat = false;

  Future<bool> savePatient(Map<String, dynamic> data) async {
    box = await Hive.openBox(_patientBox);
    if (!box.isOpen) return false;
    patient = Patient.fromJsonMap(data);
    debugPrint("UserPhone is ${patient.phone}");
    await box.put(_patientKey, jsonEncode(data));
    await box.put(_tokenKey, token);
    await box.close();
    return true;
  }

  Future<void> updatePatient() async {
    box = await Hive.openBox(_patientBox);
    if (!box.isOpen) return;

    await box.put(_patientKey, jsonEncode(patient));
    await box.close();
    debugPrint("Patient name is ${patient.name}");
  }

  Future<void> setUserOpenChat() async {
    box = await Hive.openBox(_patientBox);
    if (!box.isOpen) return;

    await box.put(_openedChatKey, true);
    await box.close();
    debugPrint("Patient opened the chat is true");
  }

  Future<bool> getPatient() async {
    box = await Hive.openBox(_patientBox);
    if (!box.isOpen || box.isEmpty) return false;
    token = await box.get(_tokenKey);
    debugPrint("Token is $token");
    patient = Patient.fromJsonMap(jsonDecode(await box.get(_patientKey)));
    userOpenedChat = await box.get(_openedChatKey) ?? false;
    debugPrint("Patient is ${patient.toJson()}");
    await box.close();
    return true;
  }

  Future<bool> logoutPatient() async {
    try {
      box = await Hive.openBox(_patientBox);
      if (!box.isOpen) return false;
      box.clear();
      await box.close();
      return true;
    } catch (e) {
      debugPrint("logout error $e");
      return false;
    }
  }

  void saveLocale(Locale locale) async {
    box = await Hive.openBox(_patientBox);
    if (!box.isOpen) return;
    await box.put(_localeKey, locale.languageCode);
    debugPrint("Locale ${locale.languageCode} is Saved");
    box.close();
  }

  Future<Locale> getLocale() async {
    box = await Hive.openBox(_patientBox);
    if (!box.isOpen || box.isEmpty) return Get.deviceLocale!;
    var langCode = await box.get(_localeKey);
    debugPrint("Locale $langCode retrieved from cache");
    return langCode == "ar"
        ? LocalizationHelper.locales[1]
        : LocalizationHelper.locales[0];
  }
}
