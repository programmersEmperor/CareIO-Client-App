import 'dart:developer';

import 'package:ai_health_assistance/Services/BindingService/bindings.dart';
import 'package:ai_health_assistance/Services/connectivityService/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class LifeCycleController extends SuperController {

  @override
  void onDetached() {
    log("LifeCycleController onDetached ");
  }

  @override
  void onInactive() {
    log("LifeCycleController onInactive ");
  }

  @override
  void onPaused() {
    log("LifeCycleController OnPaused ");
  }

  @override
  void onResumed() {
    log("LifeCycleController onResumed ");
    BindingService().dependencies();

    // final bool isConnectivityDeleted = Get.isRegistered<ConnectivityHandler>();
    // if(isConnectivityDeleted){
      // BindingService().dependencies();
    // }
  }
}