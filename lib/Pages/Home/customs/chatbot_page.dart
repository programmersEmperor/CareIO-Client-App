import 'package:ai_health_assistance/Components/SharedWidgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChatBotPage extends StatefulWidget {
  static const id = "/chatBotPage";

  const ChatBotPage({super.key});
  @override
  ChatBotPageState createState() => ChatBotPageState();
}

class ChatBotPageState extends State<ChatBotPage> {
  final List<ChatBubble> messages = [];
  final TextEditingController textController = TextEditingController();

  void sendMessage(bool isMe) {
    if (textController.text.isNotEmpty) {
      setState(() {
        messages.add(ChatBubble(
          message: textController.text,
          isMe: isMe,
        ));
        textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index];
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RoundedTextField(
                    controller: textController,
                    hint: "i have a cold ...",
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                GestureDetector(
                  onTap: () => sendMessage(true),
                  onLongPress: () => sendMessage(false),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    width: 10.w,
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

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.sp),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMe) ...[
              CircleAvatar(
                radius: 12.sp,
                backgroundColor: Colors.white,
              ),
            ],
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.sp),
              padding: EdgeInsets.all(8.sp),
              constraints: BoxConstraints(maxWidth: 60.w),
              decoration: BoxDecoration(
                color:
                    isMe ? Color(0xffdeebe9) : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12.0),
                  topRight: const Radius.circular(12.0),
                  bottomLeft: isMe
                      ? const Radius.circular(12.0)
                      : const Radius.circular(0.0),
                  bottomRight: isMe
                      ? const Radius.circular(0.0)
                      : const Radius.circular(12.0),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                    color: isMe ? Theme.of(context).primaryColor : Colors.white,
                    fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
