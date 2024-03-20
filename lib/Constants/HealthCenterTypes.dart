import 'package:ai_health_assistance/Localization/app_strings.dart';

enum HealthCenterTypes{
  hospital(AppStrings.hospital),
  healthCenter(AppStrings.healthCenter),
  clinic(AppStrings.externalClinic);

  final String value;
  const HealthCenterTypes(this.value);
}