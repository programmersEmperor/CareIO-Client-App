import 'dart:developer';
import 'package:ai_health_assistance/Services/connectivityService/connectivity_service.dart';
import 'package:get/get.dart';

class LifeCycleController extends SuperController {

  @override
  void onDetached() {
    log("LifeCycleController onDetached ");
    Get.find<ConnectivityHandler>().refreshOnline();
  }

  @override
  void onInactive() {
    log("LifeCycleController onInactive ");
    Get.find<ConnectivityHandler>().refreshOnline();
  }

  @override
  void onPaused() {
    log("LifeCycleController OnPaused ");
    Get.find<ConnectivityHandler>().refreshOnline();
  }

  @override
  void onResumed() {
    log("LifeCycleController onResumed ");
    Get.find<ConnectivityHandler>().refreshOnline();

    // final bool isConnectivityDeleted = Get.isRegistered<ConnectivityHandler>();
    // if(isConnectivityDeleted){
      // BindingService().dependencies();
    // }
  }
}