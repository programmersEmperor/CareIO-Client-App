import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class CustomSearchBar extends StatelessWidget {
  final bool showFilter;
  final String title;
  final dynamic controller;
  const CustomSearchBar({
    super.key,
    this.showFilter = true,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            color: Colors.grey.shade200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  const Icon(
                    Boxicons.bx_search,
                    color: Colors.black54,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showFilter) ...[
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: controller.showFilter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(7),
                child: Icon(
                  Boxicons.bx_filter_alt,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
