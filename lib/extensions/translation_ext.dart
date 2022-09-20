// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

extension KDTransLate on String {
  bool get _fullLocaleAndKey {
    return Get.translations.containsKey(
            "${Get.locale!.languageCode}_${Get.locale!.countryCode}") &&
        Get.translations[
                "${Get.locale!.languageCode}_${Get.locale!.countryCode}"]!
            .containsKey(this.toLowerCase());
  }

  Map<String, String>? get _getSimilarLanguageTranslation {
    final translationsWithNoCountry = Get.translations
        .map((key, value) => MapEntry(key.split("_").first, value));
    final containsKey = translationsWithNoCountry
        .containsKey(Get.locale!.languageCode.split("_").first);

    if (!containsKey) {
      return null;
    }

    return translationsWithNoCountry[Get.locale!.languageCode.split("_").first];
  }

  String get gttr {
    if (!ishindi) return this;
    if (Get.locale?.languageCode == null) return this;

    if (_fullLocaleAndKey) {
      return Get.translations[
              "${Get.locale!.languageCode}_${Get.locale!.countryCode}"]![
          this.toLowerCase()]!;
    }
    final similarTranslation = _getSimilarLanguageTranslation;
    if (similarTranslation != null &&
        similarTranslation.containsKey(this.toLowerCase())) {
      return similarTranslation[this.toLowerCase()]!;
    } else if (Get.fallbackLocale != null) {
      final fallback = Get.fallbackLocale!;
      final key = "${fallback.languageCode}_${fallback.countryCode}";

      if (Get.translations.containsKey(key) &&
          Get.translations[key]!.containsKey(this.toLowerCase())) {
        return Get.translations[key]![this.toLowerCase()]!;
      }
      if (Get.translations.containsKey(fallback.languageCode) &&
          Get.translations[fallback.languageCode]!
              .containsKey(this.toLowerCase())) {
        return Get.translations[fallback.languageCode]![this.toLowerCase()]!;
      }
      return this;
    } else {
      return this;
    }
  }

  String trArgskd([List<String> args = const []]) {
    var key = gttr;
    if (args.isNotEmpty) {
      for (final arg in args) {
        key = key.replaceFirst(RegExp(r'%s'), arg.toString());
      }
    }
    return key;
  }

  String trPlural([String? pluralKey, int? i, List<String> args = const []]) {
    return i == 1 ? trArgskd(args) : pluralKey!.trArgskd(args);
  }

  String trParamskd([Map<String, String> params = const {}]) {
    var trans = gttr;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        trans = trans.replaceAll('@$key', value);
      });
    }
    return trans;
  }

  String trPluralParams(
      [String? pluralKey, int? i, Map<String, String> params = const {}]) {
    return i == 1 ? trParamskd(params) : pluralKey!.trParamskd(params);
  }
}

Map<String, Map<String, String>> gttransMaper(Map<String, String> data) {
  Map<String, String> eng = {};
  Map<String, String> hi = {};
  data.forEach((key, value) {
    eng[key.toLowerCase()] = key;
    hi[key.toLowerCase()] = value;
  });

  Map<String, Map<String, String>> result = {'en': eng, 'hi': hi};
  return result;
}

bool get ishindi {
  return !((Get.locale ?? const Locale('en')) == const Locale('en'));
}
