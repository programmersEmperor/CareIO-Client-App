import 'dart:io';

import 'package:ai_health_assistance/Pages/Authentication/otp/otp.dart';
import 'package:ai_health_assistance/Services/Api/authentication.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:ai_health_assistance/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AuthenticationController extends GetxController
    with GetTickerProviderStateMixin {
  final GlobalKey<FormBuilderState> loginFormKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> signupFormKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> newPasswordFormKey =
      GlobalKey<FormBuilderState>();
  final apiService = Get.find<AuthenticationApiService>();
  String otpCode = '';
  Rx<XFile> image = XFile('').obs;
  late ImagePicker picker;
  File get getImage => File(image.value.path);
  Map<String, dynamic> formValues = {};
  RxBool get isLoading => apiService.isLoading;

  void removeImage() {
    image.value = XFile('');
  }

  void showImageSelector(BuildContext context) {
    AnimationController controller =
        BottomSheet.createAnimationController(this);
    controller.duration = 500.milliseconds;
    controller.reverseDuration = 300.milliseconds;
    controller.drive(CurveTween(curve: Curves.fastEaseInToSlowEaseOut));
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
      useSafeArea: true,
      transitionAnimationController: controller,
      constraints: BoxConstraints(maxHeight: 94.h),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.sp, right: 12.sp, left: 12.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              ListTile(
                onTap: () => pickImage(ImageSource.camera),
                title: const Text("Take Image"),
                subtitle: const Text("Take a clear image using camera app"),
                titleTextStyle: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
                subtitleTextStyle: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.black54,
                ),
                iconColor: AppColors.primaryColor,
                leading: SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: Icon(
                    Boxicons.bx_camera,
                    size: 20.sp,
                  ),
                ),
              ),
              ListTile(
                onTap: () => pickImage(ImageSource.gallery),
                title: const Text("Select Image"),
                subtitle: const Text("Select a clear image using camera roll"),
                titleTextStyle: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
                subtitleTextStyle: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.black54,
                ),
                iconColor: AppColors.primaryColor,
                leading: SizedBox(
                  width: 10.w,
                  height: 10.h,
                  child: Icon(
                    Boxicons.bx_image_add,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void pickImage(ImageSource source) async {
    try {
      picker = ImagePicker();
      var takenImage = await picker.pickImage(
        source: source,
      );
      if (takenImage == null) return;
      image.value = takenImage;
      debugPrint("Path: ${image.value.path}");
      Get.close(0);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool _isFormValid({bool login = false, bool signup = false}) {
    bool valid = false;
    if (login) {
      valid = loginFormKey.currentState?.saveAndValidate() ?? false;
      if (valid) {
        formValues = loginFormKey.currentState!.value;
      }
    }

    if (signup) {
      valid = signupFormKey.currentState?.saveAndValidate() ?? false;
      if (valid) {
        formValues = signupFormKey.currentState!.value;
      }
    }

    return valid;
  }

  Future<void> login() async {
    if (!_isFormValid(login: true)) return;
    final response = await apiService.login(body: formValues);
    if (response == null) return;

    Get.find<UserSession>().token = response.data['result'];
    Get.toNamed(OTPPage.id);
  }

  Future<void> signup() async {
    if (!_isFormValid(signup: true)) return;
    if (formValues['password'] != formValues['confirm Password']) {
      showSnack(title: "Password", description: "Password is not identical");
      return;
    }
    final response = await apiService.signup(body: formValues);
    debugPrint("The response ${response.toString()}");
    if (response == null) return;
    Get.find<UserSession>().token = response.data['result'];
    Get.toNamed(OTPPage.id);
  }

  Future<void> sendOtp() async {
    if (!_isFormValid()) return;
    isLoading(true);
    final response = await apiService.sendOtp(body: formValues);
  }

  Future<void> verifyOtp() async {
    debugPrint("Code $otpCode");
    if (otpCode.isEmpty || otpCode.length != 6) {
      showSnack(title: "OTP", description: "OTP must be 6 digit");
      return;
    }

    final response =
        await apiService.verifyOtp(otp: int.parse(otpCode), isReset: false);
    if (response == null) return;
  }
}
