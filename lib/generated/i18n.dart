import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => "PLPIDB";
  String get github => "http://www.plpidb.com";
  String get home => "Home";
  String get navi => "Learn";
  String get proName => "PLPIDB";
  String get project => "Team";
  String get tree => "Data";
}

class $pt extends S {
  const $pt();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get github => "http://www.plpidb.com";
  @override
  String get appName => "PLPIDB";
  @override
  String get tree => "Centro de Informações";
  @override
  String get project => "Introdução da equipe";
  @override
  String get home => "Página inicial";
  @override
  String get navi => "Realizações acadêmicas";
  @override
  String get proName => "PLPIDB";
}

class $zh_MO extends S {
  const $zh_MO();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get github => "http://www.plpidb.com";
  @override
  String get navi => "學術成果";
  @override
  String get appName => "葡語國家投資環境資料庫";
  @override
  String get tree => "資料中心";
  @override
  String get project => "團隊介紹";
  @override
  String get proName => "PLPIDB";
  @override
  String get home => "首頁";
}

class $en extends S {
  const $en();
}

class $zh_CN extends S {
  const $zh_CN();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get github => "http://www.plpidb.com";
  @override
  String get navi => "学术成果";
  @override
  String get appName => "葡语国家投资环境数据库";
  @override
  String get tree => "数据中心";
  @override
  String get project => "团队介绍";
  @override
  String get proName => "PLPIDB";
  @override
  String get home => "首页";
}

class $zh extends S {
  const $zh();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get github => "http://www.plpidb.com";
  @override
  String get navi => "學術成果";
  @override
  String get appName => "葡語國家投資環境資料庫";
  @override
  String get tree => "資料中心";
  @override
  String get project => "團隊介紹";
  @override
  String get proName => "PLPIDB";
  @override
  String get home => "首頁";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("pt", ""),
      Locale("zh", "MO"),
      Locale("en", ""),
      Locale("zh", "CN"),
      Locale("zh", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "pt":
          S.current = const $pt();
          return SynchronousFuture<S>(S.current);
        case "zh_MO":
          S.current = const $zh_MO();
          return SynchronousFuture<S>(S.current);
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        case "zh_CN":
          S.current = const $zh_CN();
          return SynchronousFuture<S>(S.current);
        case "zh":
          S.current = const $zh();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
