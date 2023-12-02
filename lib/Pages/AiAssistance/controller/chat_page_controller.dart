import 'dart:async';
import 'dart:io';

import 'package:ai_health_assistance/Pages/AiAssistance/custom/chat_bot_notification_alert.dart';
import 'package:ai_health_assistance/Pages/AiAssistance/custom/chat_bubble.dart';
import 'package:ai_health_assistance/Pages/AiAssistance/custom/image_selector_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ChatUiController extends GetxController with GetTickerProviderStateMixin {
  final RxList messages = [].obs;
  final FocusNode textFocusNode = FocusNode();
  final TextEditingController textController = TextEditingController();
  final ScrollController listController = ScrollController();
  final RxBool isPopUpAnimated = false.obs;
  Rx<XFile> image = XFile('').obs;
  late ImagePicker picker;

  File get getImage => File(image.value.path);

  late AnimationController controller;

  late Timer showNotificationTimer;
  @override
  void onInit() {
    super.onInit();
    pushNoteNotification();
    picker = ImagePicker();
  }

  void moveListToBottom() {
    if (listController.position.pixels <=
        listController.position.maxScrollExtent) {
      listController.animateTo(
        listController.position.maxScrollExtent + 55,
        duration: 1.seconds,
        curve: Curves.fastOutSlowIn,
      );
    }
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

  void uploadTheImage(ImageSource source) async {
    try {
      var takenImage = await picker.pickImage(
        source: source,
      );
      if (takenImage == null) return;
      image.value = takenImage;
      debugPrint("Path: ${image.value.path}");
    } catch (e) {
      debugPrint(e.toString());
    }
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
    playNotificationSound();
    if (textController.text.isNotEmpty) {
      messages.add(ChatBubble(
        message: textController.text,
        isMe: isMe,
      ));
      textController.clear();
    }
    moveListToBottom();
  }

  void removeImage() {
    image.value = XFile('');
  }

  void addImageToChat() {
    playNotificationSound();
    messages.add(ChatBubble(
      message: '',
      isMe: true,
      image: getImage,
    ));
    Get.close(0);
    image.value = XFile('');
    textFocusNode.unfocus(
        disposition: UnfocusDisposition.previouslyFocusedChild);
    moveListToBottom();
  }

  void disposePopUp() {
    messages.removeAt(0);
  }

  void showImageSelector(BuildContext context) {
    AnimationController controller =
        BottomSheet.createAnimationController(this);
    controller.duration = 500.milliseconds;
    controller.reverseDuration = 300.milliseconds;
    controller.drive(CurveTween(curve: Curves.fastEaseInToSlowEaseOut));
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
      useSafeArea: true,
      transitionAnimationController: controller,
      constraints: BoxConstraints(maxHeight: 94.h),
      builder: (BuildContext context) {
        return ImageSelectorBottomSheet(
          uiController: this,
        );
      },
    );
  }

  @override
  void onClose() {
    controller.dispose();
    super.dispose();

    super.onClose();
  }
}
