import 'package:ai_health_assistance/Components/SharedWidgets/main_category_appbar.dart';
import 'package:ai_health_assistance/Components/SharedWidgets/rounded_text_field.dart';
import 'package:ai_health_assistance/Pages/Search/controller/specific_search_controller.dart';
import 'package:ai_health_assistance/Pages/Search/custom/search_term_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SpecificSearchPage extends StatelessWidget {
  static const id = "/SpecificSearchPage";
  const SpecificSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SpecificSearchController uiController = Get.put(SpecificSearchController());
    return Scaffold(
      appBar: mainCategoryAppBar(null, "Search in doctors"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedTextField(
              controller: uiController.textEditingController,
              onChange: uiController.filterSearchResults,
              showAttachment: false,
              hint: "search for anything",
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: Wrap(
                spacing: 7.sp,
                runSpacing: 7.sp,
                children: const [
                  LatestSearchTermsChip(),
                  LatestSearchTermsChip(),
                  LatestSearchTermsChip(),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: uiController.filteredData.length - 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(uiController.filteredData[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
