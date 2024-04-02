import 'dart:convert';
import 'dart:io';

import 'package:ai_health_assistance/Localization/app_strings.dart';
import 'package:ai_health_assistance/Models/Plan.dart';
import 'package:ai_health_assistance/Models/client.dart';
import 'package:ai_health_assistance/Pages/Home/controller/home_page_controller.dart';
import 'package:ai_health_assistance/Pages/Home/home_main_page.dart';
import 'package:ai_health_assistance/Pages/Profile/custom/change_language_sheet.dart';
import 'package:ai_health_assistance/Pages/Profile/custom/logout_bottom_sheet.dart';
import 'package:ai_health_assistance/Services/Api/patient.dart';
import 'package:ai_health_assistance/Services/CachingService/user_session.dart';
import 'package:ai_health_assistance/Theme/app_colors.dart';
import 'package:ai_health_assistance/Utils/bottom_sheet_handle.dart';
import 'package:ai_health_assistance/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePageController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<Patient> patient = Get.find<UserSession>().patient.obs;
  final GlobalKey<FormBuilderState> key = GlobalKey<FormBuilderState>();

  RxBool isLoading = false.obs;
  RxBool changeImage = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  List<Plan> get plans => Get.find<UserSession>().plans;

  Rx<XFile> image = XFile('').obs;
  late ImagePicker picker;
  File get getImage => File(image.value.path);

  void removeImage() {
    changeImage(true);
    image.value = XFile('');
  }

  void initControllers() {
    name.text = patient.value.name;
    phone.text = patient.value.phone;
    email.text = patient.value.email;
  }

  void editPatient() async {
    if (!key.currentState!.saveAndValidate()) {
      return;
    }

    isLoading(true);
    var response = await Get.find<PatientApiService>().update(
        name: name.text,
        avatar: getImage,
        email: email.text,
      removeAvatar: changeImage.isTrue && image.value.path.isEmpty,
    );
    isLoading(false);

    if (response == null) return;
    var decodedResponse = json.decode(response.toString());
    Get.find<UserSession>().patient.name = decodedResponse["result"]["name"];
    Get.find<UserSession>().patient.email = decodedResponse["result"]["email"] ?? "";
    Get.find<UserSession>().patient.avatar = decodedResponse["result"]["avatar"] ?? "";
    Get.find<UserSession>().updatePatient();

    refreshPatientDataInOtherPages();

    showSnack(
        title: "Profile Updated",
        description: "Your data has been updated successfully");
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

  void showLogoutBottomSheet() {
    Get.put(BottomSheetController())
        .showBottomSheet(const LogoutBottomSheet(), 100.h);
  }

  void changeLanguageBottomSheet() {
    Get.put(BottomSheetController())
        .showBottomSheet(const ChangeLanguageSheet(), 100.h);
  }

  void refreshPatientDataInOtherPages(){
    Get.find<HomePageController>().patient.value = Get.find<UserSession>().patient;
    Get.find<HomePageController>().patient.refresh();

    Get.find<ProfilePageController>().patient.value = Get.find<UserSession>().patient;
    Get.find<ProfilePageController>().patient.refresh();
  }

  Future<void> refreshPatientData() async {
    try{

      var response = await Get.find<PatientApiService>().getPatientData();
      if(response.statusCode != 200) return;
      final patientData = {"patient": response.data['result']};
      await Get.find<UserSession>().savePatient(patientData);

      refreshPatientDataInOtherPages();
    }
    catch(e){
        showSnack(title: "Error", description: e.toString());
    }
  }

  void openWhatsapp() async {
      String contact = "+967774569423";
      String message = Get.locale.toString() == 'ar_Ar' ? 'مربحا! احتاج الى مساعدة' : 'Hi, I need some help';
      var androidUrl = "whatsapp://send?phone=$contact&text=$message";
      var iosUrl = "https://wa.me/$contact?text=${Uri.parse(message)}";

      try{
        if(Platform.isIOS){
          await launchUrl(Uri.parse(iosUrl));
        }
        else{
          await launchUrl(Uri.parse(androidUrl));
        }
      } on Exception{
        showSnack(title: "Error", description: "Whatsapp is not installed");
      }
    }
}
