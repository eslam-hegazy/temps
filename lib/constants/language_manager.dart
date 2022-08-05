import 'package:flutter/material.dart';

import '../../data/local/cache_helper.dart';
import 'end_points.dart';

enum LanguageType { english, arabic }

const String arabic = "ar";
const String english = "en";
const String assetPathLocalizations = "assets/i18n";

const Locale arabicLocal = Locale('ar');
const Locale englishLocal = Locale('en');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}

class LanguageManager {
  static Future<String> getAppLanguage() async {
    String? language =
        CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }

  static Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      CacheHelper.saveDataSharedPreference(
          key: appLanguageSharedKey, value: LanguageType.english.getValue());
    } else {
      CacheHelper.saveDataSharedPreference(
          key: appLanguageSharedKey, value: LanguageType.arabic.getValue());
    }
  }

  static Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}
