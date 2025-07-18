import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/Appointment.dart';
import 'package:ai_health_assistance/Pages/Home/custom/cancel_appointment_confirm_sheet.dart';
import 'package:ai_health_assistance/Pages/Home/custom/rating_bottom_sheet_widget.dart';
import 'package:ai_health_assistance/Pages/Home/custom/reschedule_appointment_sheet.dart';
import 'package:ai_health_assistance/Services/Api/appointment.dart';
import 'package:ai_health_assistance/Services/NotificationService/notification_service_handler.dart';
import 'package:ai_health_assistance/Utils/appointment_enum.dart';
import 'package:ai_health_assistance/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppointmentController extends GetxController with GetTickerProviderStateMixin {

  late TabController tabController;
  final AppointmentApiService _apiService = Get.find<AppointmentApiService>();

  final List<PagingController<int, Appointment>> appointmentsPagingControllers = [];
  final List<RxBool> appointmentsPageLoadings = [];


  RxBool cancelLoading = false.obs;
  RxBool ratingLoading = false.obs;


  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this);
    initializeControllerPagesAndLoadings();
    super.onInit();
  }

  void initializeControllerPagesAndLoadings(){
    for(AppointmentTypes type in AppointmentTypes.values){

      appointmentsPageLoadings.add(false.obs);

      final PagingController<int, Appointment> pagingController = PagingController(firstPageKey: 1);
      pagingController.addPageRequestListener((pageKey) {
        fetchAppointments(pageKey: pageKey,type: type);
      });
      pagingController.refresh();
      appointmentsPagingControllers.add(pagingController);

    }
  }

  Future<void> fetchAppointments({required int pageKey, required AppointmentTypes type}) async {
    try{
      final List<Appointment> appointments =[];
      appointmentsPageLoadings[type.index](true);
      var response = await _apiService.fetchAppointments(params: {'type': type.index + 1, 'page': pageKey});
      appointmentsPageLoadings[type.index](false);
      if (response == null) return;
      for (var appointment in response.data['result']['data']) {
        appointments.add(Appointment.fromJson(appointment));
      }

      if(response.data['result']['meta']['last_page'] <= pageKey){
        appointmentsPagingControllers[type.index].appendLastPage(appointments);
      }
      else{
        appointmentsPagingControllers[type.index].appendPage(appointments, pageKey+1);
      }
    } catch(e){
      appointmentsPageLoadings[type.index](false);
      debugPrint("Error in healthCenter is $e");
      appointmentsPagingControllers[type.index].error = e;
    }
  }

  // actions
  void rateAppointment({required int appointmentId, required int rating}) async {
    String message= "";
    try {
      ratingLoading(true);
      var response = await _apiService.rateAppointment(id: appointmentId, rating: rating);
      ratingLoading(false);
      if (response == null) return;

      if (response.data['result'].isEmpty) {
        appointmentsPagingControllers[AppointmentTypes.completed.index].refresh();

        Get.close(0);
        showSnack(
            title: AppStrings.ratingPosted.tr,
            description: message);
      }
    } catch (e) {
      ratingLoading(false);
      showSnack(title: AppStrings.cannotCompleteOperation, description: message);
    }
  }

  void cancelAppointment({required int id}) async {
    String message = "";
    try{
      if (cancelLoading.isTrue) return;

      cancelLoading(true);
      var response = await _apiService.cancelAppointment(id: id);
      cancelLoading(false);
      if (response == null) return;
      message = response.data['message'];

      if (response.data['result'].isEmpty) {
        appointmentsPagingControllers[AppointmentTypes.canceled.index].refresh();
        appointmentsPagingControllers[AppointmentTypes.upcoming.index].refresh();

        Get.close(0);
        showSnack(title: AppStrings.appointmentCanceled.tr, description: message);
        NotificationServiceHandler.unscheduleLocalNotification(id);
      }
    }
    catch(e){
      cancelLoading(false);
      showSnack(title: AppStrings.cannotCompleteOperation.tr, description: message);

    }
  }

  void rescheduleAppointment({required Appointment appointment, required String date, required String time}) async {
    String message = "";
    try {
      if (cancelLoading.isTrue) return;

      if (time.isEmpty) {
        showSnack(title: AppStrings.cannotCompleteOperation.tr, description: AppStrings.timeNotSelected.tr);
        return;
      }
      cancelLoading(true);
      var response = await _apiService.rescheduleAppointment(id: appointment.id, date: date, time: time);
      cancelLoading(false);
      if (response == null) return;
      message = response.data['message'];

      if (response.data['result'].isEmpty) {
        appointmentsPagingControllers[AppointmentTypes.upcoming.index].refresh();
        if(AppointmentTypes.canceled.value.contains(appointment.status)){
          appointmentsPagingControllers[AppointmentTypes.canceled.index].refresh();
        }
        else if (AppointmentTypes.completed.value.contains(appointment.status)){
          appointmentsPagingControllers[AppointmentTypes.completed.index].refresh();
        }

        Get.close(0);
        showSnack(title: AppStrings.appointmentReschedule.tr, description: message);
        NotificationServiceHandler.unscheduleLocalNotification(appointment.id);
      }
    } catch (e) {
      cancelLoading(false);
      showSnack(title: AppStrings.cannotCompleteOperation.tr, description: message);
    }
  }

  // confirm bottom sheets
  void confirmCancelAppointment({required Appointment appointment}) {
    Get.bottomSheet(CancelAppointmentConfirmSheet(
        loading: cancelLoading,
        onTap: () => cancelAppointment(id: appointment.id),
        appointment: appointment));
  }

  void showRatingBottomSheet({required int appointmentId}) {
    Get.bottomSheet(RatingWidget(
      appointmentId: appointmentId,
    ));
  }

  void confirmRescheduleAppointment({required Appointment appointment}) {
    Get.bottomSheet(
      RescheduleAppointmentConfirmSheet(
          loading: cancelLoading,
          onTap: (date, time) => rescheduleAppointment(appointment: appointment, date: date, time: time),
          appointment: appointment),
      isScrollControlled: true,
    );
  }
}
