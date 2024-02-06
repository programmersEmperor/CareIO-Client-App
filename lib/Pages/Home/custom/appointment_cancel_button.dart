import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppointmentCancelButton extends StatelessWidget {
  const AppointmentCancelButton({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor:
              MaterialStatePropertyAll(Colors.red.withOpacity(0.2)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)))),
      child: Text(
        "Cancel",
        style: TextStyle(
            color: Colors.red, fontSize: 9.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
