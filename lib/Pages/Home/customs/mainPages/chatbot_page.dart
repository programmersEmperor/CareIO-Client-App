import 'package:ai_health_assistance/Components/SharedWidgets/rounded_text_field.dart';
import 'package:ai_health_assistance/Pages/Home/UiController/chat_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  static const id = "/chatBotPage";

  @override
  Widget build(BuildContext context) {
    ChatUiController uiController = Get.put(ChatUiController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30.sp,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15.sp,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: uiController.listController,
                itemCount: uiController.messages.length,
                itemBuilder: (context, index) {
                  return uiController.messages[index];
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: RoundedTextField(
                    controller: uiController.textController,
                    hint: "i have a cold ...",
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                GestureDetector(
                  onTap: () => uiController.sendMessage(true),
                  onLongPress: () => uiController.sendMessage(false),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    width: 12.w,
                    height: 7.5.h,
                    child: Icon(
                      Icons.send_rounded, // Your icon here
                      size: 15.sp, // Icon size
                      color: Colors.white, // Icon color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
