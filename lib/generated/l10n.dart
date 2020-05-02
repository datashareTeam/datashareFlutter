// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'PLPIDB',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  String get appName {
    return Intl.message(
      'PLPIDB',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get proName {
    return Intl.message(
      'PLPIDB',
      name: 'proName',
      desc: '',
      args: [],
    );
  }

  String get github {
    return Intl.message(
      'https://github.com/yechaoa/wanandroid_flutter',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  String get tree {
    return Intl.message(
      'Data',
      name: 'tree',
      desc: '',
      args: [],
    );
  }

  String get navi {
    return Intl.message(
      'Learn',
      name: 'navi',
      desc: '',
      args: [],
    );
  }

  String get project {
    return Intl.message(
      'Team',
      name: 'project',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''), Locale('en', 'US'), Locale('zh', ''), Locale('zh', 'CN'), Locale('zh', 'Hant'), Locale('zh', 'MO'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}