import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class TextInputField extends StatelessWidget {
  final String name;
  final TextInputType inputType;
  final bool password;
  const TextInputField({
    super.key,
    required this.name,
    this.inputType = TextInputType.text,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.sp,
      child: FormBuilderTextField(
        name: name,
        obscureText: password,
        maxLength: inputType == TextInputType.phone ? 9 : null,
        cursorRadius: const Radius.circular(10),
        cursorColor: AppColors.primaryColor,
        keyboardType: inputType,
        style: TextStyle(fontSize: 9.sp, color: Colors.black54),
        decoration: InputDecoration(
          counter: const SizedBox(),
          floatingLabelStyle:
              TextStyle(color: AppColors.primaryColor, fontSize: 12.sp),
          hintText: name,
          hintStyle: TextStyle(fontSize: 8.sp),
          fillColor: CupertinoColors.systemGrey5,
          filled: true,
          focusColor: AppColors.primaryColor,
          labelText: name,
          labelStyle: TextStyle(
            fontSize: 10.sp,
            color: Colors.black45,
          ),
          contentPadding: EdgeInsets.only(top: 2.sp, left: 10.sp, right: 10.sp),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: const BorderSide(color: CupertinoColors.systemGrey5),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: AppColors.primaryColor)),
        ),
      ),
    );
  }
}
