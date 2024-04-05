import 'package:ai_health_assistance/Models/Clinic.dart';
import 'package:ai_health_assistance/Models/Doctor.dart';
import 'package:ai_health_assistance/Services/Api/doctors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClinicsUiController extends GetxController {
  late Clinic clinic;
  RxBool get isLoading => apiService.isLoading;
  Map<String, dynamic> data = {};
  final PagingController<int, Doctor> pagingController = PagingController(firstPageKey: 0);
  List<Doctor> doctors = [];
  final apiService = Get.find<DoctorsApiService>();
  final _pageSize = 10;


  @override
  void onInit() {

    clinic = Get.arguments[0]['clinic'];
    data = {
      "clinic": clinic.id
    };
    debugPrint("clinic: " + data.toString());
    pagingController.addPageRequestListener((pageKey) {
      fetchDoctors(pageKey: pageKey, params: data);
    });
    super.onInit();
  }

  void fetchDoctors(
      {required int pageKey, Map<String, dynamic>? params}) async {
    try {
      doctors = [];
      debugPrint("Fetch doctors");
      final pageSize = pageKey ~/ 10;
      var response = await apiService.fetchDoctors(
          params: params, pageSize: pageSize == 0 ? 1 : pageSize);
      if (response == null) return;

      for (var doctor in response.data['result']['data']) {
        doctors.add(Doctor.fromJson(doctor));
      }
      final isLastPage = doctors.length < _pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(doctors);
      } else {
        final nextPageKey = pageKey + doctors.length;
        pagingController.appendPage(doctors, nextPageKey);
      }
    } catch (error) {
      debugPrint("Error in doctors is $error");
      pagingController.error = error;
    }
  }
}
