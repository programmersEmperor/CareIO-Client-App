import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class LatestSearchTermsChip extends StatelessWidget {
  const LatestSearchTermsChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(8),
      child: Text(
        "Search term one",
        style: TextStyle(
          fontSize: 8.5,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
