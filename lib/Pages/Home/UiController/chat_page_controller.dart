import 'dart:async';

import 'package:ai_health_assistance/Pages/Home/customs/chat_bot_notification_alert.dart';
import 'package:ai_health_assistance/Pages/Home/customs/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

class ChatUiController extends GetxController with GetTickerProviderStateMixin {
  final RxList messages = [].obs;
  final TextEditingController textController = TextEditingController();
  final ScrollController listController = ScrollController();
  final RxBool isPopUpAnimated = false.obs;

  late AnimationController controller;

  late Timer showNotificationTimer;
  @override
  void onInit() {
    super.onInit();
    pushNoteNotification();
  }

  void moveListToBottom() {
    listController.animateTo(
      listController.position.maxScrollExtent + 55,
      duration: 1.seconds,
      curve: Curves.fastOutSlowIn,
    );
  }

  void initializeAnimation() {
    controller = AnimationController(vsync: this, duration: 5.seconds);
    controller.forward();
    controller.addListener(
      () {
        if (controller.isCompleted) {
          controller.reverse();
        }
        if (controller.isDismissed) {
          controller.forward();
        }
      },
    );
  }

  void playNotificationSound() async {
    await FlutterRingtonePlayer.play(fromAsset: 'assets/sounds/pop-up.mp3');
  }

  void pushNoteNotification() {
    showNotificationTimer = Timer(
      1.seconds,
      () async {
        playNotificationSound();
        initializeAnimation();
        messages.add(ChatBotNotificationAlert(controller: this));
        isPopUpAnimated(true);
      },
    );
  }

  void sendMessage(bool isMe) {
    if (textController.text.isNotEmpty) {
      messages.add(ChatBubble(
        message: textController.text,
        isMe: isMe,
      ));
      textController.clear();
    }
    moveListToBottom();
  }

  void disposePopUp() {
    messages.removeAt(0);
  }

  @override
  void onClose() {
    controller.dispose();
    super.dispose();

    super.onClose();
  }
}
