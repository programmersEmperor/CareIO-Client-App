import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const RoundedTextField(
      {super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      /* padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20.sp), // Adjust the radius as needed
      ),*/
      child: TextField(
        controller: controller,
        maxLines: 6,
        minLines: 1,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.black54,
        ),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: GestureDetector(
            onTap: () {
              debugPrint("Hello");
            },
            child: Icon(
              Icons.attach_file_rounded,
              color: Theme.of(context).primaryColor,
              size: 14.sp,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.black45),
          counter: const SizedBox(),
          constraints: BoxConstraints(
            minHeight: 10.sp,
            maxHeight: 150.sp,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.sp),
              borderRadius: BorderRadius.circular(15.sp),
              gapPadding: 0),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).cardColor, width: 1.sp),
              borderRadius: BorderRadius.circular(15.sp),
              gapPadding: 0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.sp),
              borderRadius: BorderRadius.circular(15.sp),
              gapPadding: 0),
        ),
      ),
    );
  }
}
