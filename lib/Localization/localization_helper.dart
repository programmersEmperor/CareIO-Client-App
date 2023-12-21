import 'package:get/get.dart';

import 'languages/ar.dart';
import 'languages/en.dart';

class LocalizationHelper extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_Us": en,
        "ar_AR": ar,
      };
}
