import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.sp, left: 5.sp, right: 5.sp),
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
                child: Icon(
                  Icons.android,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.sp),
              padding: EdgeInsets.all(8.sp),
              constraints: BoxConstraints(maxWidth: 60.w),
              decoration: BoxDecoration(
                color: isMe
                    ? const Color(0xffdeebe9)
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: isMe
                      ? const Radius.circular(12.0)
                      : const Radius.circular(0.0),
                  topRight: const Radius.circular(12.0),
                  bottomLeft: const Radius.circular(12.0),
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
