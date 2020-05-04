import 'package:flutter/material.dart';

class YLanguage {
  static String language = "";
  static List languageList = ["en", "zh_CN", "zh", "pt"];

  static String verifyLanguage(_language){

    _language = _language.replaceAll("Hans_", "").replaceAll("Hant_", "");

    if(_language[_language.length-1] == "_" ) {
      print("test " + _language.substring(0, _language.length - 1));
      _language = _language.substring(0, _language.length - 1);
    }else {
      print("test else " + _language);
      _language = _language;
    }

    if(!languageList.contains(_language)){
      print("test contains " + _language);
      _language = _language.split("_")[0];
    }
    return _language;
  }

  static setLanguage(device){
    language = verifyLanguage(device);
  }


  /* 语言列表 */
  static Map getLanguageMap(){
    print("--------" + language);
    if(language == "zh_CN")
      return languageMapCN;
    if(language.startsWith("zh"))
      return languageMapMO;
    if(language.startsWith("pt"))
      return languageMapPT;

    return languageMap;
  }
  static const Map languageMap = {
    0:{
      "code": "en",
      "languageCode": "en",
      "scriptCode": "",
      "countryCode": "",
      "name": "English",
      "locale": Locale("en")
    },
    1:
    {
      "code": "zh_CN",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "CN",
      "name": "Simple Chinese",
      "locale": Locale("zh", "CN")
    },
    2:{
      "code": "zh",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "",
      "name": "Tradicional Chinese",
      "locale": Locale("zh")
    },
    3:{
      "code": "pt",
      "languageCode": "pt",
      "scriptCode": "",
      "countryCode": "",
      "name": "Portuguese",
      "locale": Locale("pt")
    }
  };

  static const Map languageMapCN = {
    0: {
      "code": "en",
      "languageCode": "en",
      "scriptCode": "",
      "countryCode": "",
      "name": "英文",
      "locale": Locale("en")
    },
    1:
    {
      "code": "zh_CN",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "CN",
      "name": "简体中文",
      "locale": Locale("zh", "CN")
    },
    2:{
      "code": "zh",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "",
      "name": "繁体中文",
      "locale": Locale("zh")
    },
    3:{
      "code": "pt",
      "languageCode": "pt",
      "scriptCode": "",
      "countryCode": "",
      "name": "葡文",
      "locale": Locale("pt")
    }
  };
  static const Map languageMapMO = {
    0: {
      "code": "en",
      "languageCode": "en",
      "scriptCode": "",
      "countryCode": "",
      "name": "英文",
      "locale": Locale("en")
    },
    1:
    {
      "code": "zh_CN",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "CN",
      "name": "簡體中文",
      "locale": Locale("zh", "CN")
    },
    2:{
      "code": "zh",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "",
      "name": "繁體中文",
      "locale": Locale("zh", "MO")
    },
    3:{
      "code": "pt",
      "languageCode": "pt",
      "scriptCode": "",
      "countryCode": "",
      "name": "葡文",
      "locale": Locale("pt")
    }
  };
  static const Map languageMapPT = {
    0: {
      "code": "en",
      "languageCode": "en",
      "scriptCode": "",
      "countryCode": "",
      "name": "Inglês",
      "locale": Locale("en")
    },
    1:
    {
      "code": "zh_CN",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "CN",
      "name": "Chinês simplificado",
      "locale": Locale("zh", "CN")
    },
    2:{
      "code": "zh",
      "languageCode": "zh",
      "scriptCode": "",
      "countryCode": "",
      "name": "Chinês tradicional",
      "locale": Locale("zh")
    },
    3:{
      "code": "pt",
      "languageCode": "pt",
      "scriptCode": "",
      "countryCode": "",
      "name": "Português",
      "locale": Locale("pt")
    }
  };
}
