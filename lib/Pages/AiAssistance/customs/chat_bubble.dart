import 'dart:io';

import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final File? image;
  const ChatBubble(
      {super.key, required this.message, this.isMe = false, this.image});

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
                  color: AppColors.primaryColor,
                ),
              ),
            ],
            if (image == null) ...[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.sp),
                padding: EdgeInsets.all(8.sp),
                constraints: BoxConstraints(maxWidth: 60.w),
                decoration: BoxDecoration(
                    color:
                        isMe ? const Color(0xffdeebe9) : AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12.sp)),
                child: Text(
                  message,
                  style: TextStyle(
                      color: isMe ? AppColors.primaryColor : Colors.white,
                      fontSize: 10.sp),
                ),
              ),
            ],
            if (image != null) ...[
              OpenContainer(
                closedElevation: 0,
                openColor: AppColors.scaffoldColor,
                closedColor: AppColors.scaffoldColor,
                openElevation: 0,
                openBuilder: (context, builder) => Image.file(image!),
                closedBuilder: (context, builder) => Container(
                  height: 20.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    image: DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
