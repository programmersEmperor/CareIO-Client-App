import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SpecificSearchController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  List<String> data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Lemon',
    'Orange',
    'Peach',
    'Strawberry',
    'Watermelon',
  ];

  RxList<String> filteredData = <String>[].obs;
  @override
  void onInit() {
    filteredData.value  = data;
    super.onInit();
  }

  void filterSearchResults(String query) {
    List<String> searchResults = [];
    if (query.isNotEmpty) {
      for (var item in data) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      }
      filteredData(searchResults);
    } else {
      debugPrint("${data.map((element) => element)}");
      filteredData(data.toList());
    }
  }
}
