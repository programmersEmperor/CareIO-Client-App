import 'package:ai_health_assistance/Components/SharedWidgets/main_colored_button.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
      backgroundColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the border radius as needed
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
            child: Theme(
              data: ThemeData.light().copyWith(
                primaryColor: Colors.blue, // He
                colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor, secondary: Colors.blue),
                buttonTheme:
                    const ButtonThemeData(textTheme: ButtonTextTheme.normal),
              ),
              child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 50),
                  onDateChanged: (date) {}),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: MainColoredButton(text: "Apply date", onPress: () {}),
          ),
          SizedBox(
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}
