import 'dart:ui';

abstract class LanguagePreferenceCache {
  static String appLanguage = 'en';
  static Future<Locale> getLocale() async {
    // bool exist = await getUser();
    return const Locale('en', 'En');

    /*   if (exist) {
      switch (user.language.toString()) {
        case 'ar':
          {
            language.value = 'ar';
            return const Locale('ar', 'Ar');
          }
        case 'en':
          {
            language.value = 'en';
            return const Locale('en', 'En');
          }
      }
    }*/
  }
}
