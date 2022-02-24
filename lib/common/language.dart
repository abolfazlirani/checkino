import 'package:get/get.dart';

class Language extends Translations {
  final BaseLanguage faLanguage;
  final BaseLanguage enLanguage;

  Language({required this.faLanguage, required this.enLanguage});

  @override
  Map<String, Map<String, String>> get keys => {
    'fa_IR': faLanguage.language,
    'en_EN': enLanguage.language,
  };
}

abstract class BaseLanguage {
  Map<String, String> get language;
}

class EnLanguage implements BaseLanguage {
  @override
  Map<String, String> get language => {

    'splash_title': 'Checkino',
    'home_center_on': 'On',
    'home_center_off': 'Off',
    'home_toconnected': 'Protected To :',
    'home_notconnected': 'Not Connected',
    'home_connected': 'Connected',
    'home_tap': 'Tap to connect',
    'home_protect_start': 'Start Protect',
    'home_protect_stop': 'Stop Protect',

  };
}

class FaLanguage implements BaseLanguage {
  @override
  Map<String, String> get language => {

    'splash_title': 'چکینو',
    'home_center_on': 'روشن',
    'home_center_off': 'خاموش',
    'home_toconnected': 'محافظت شده از  :',
    'home_notconnected': 'غیر فعال',
    'home_connected': 'فعال',
    'home_tap': 'یک ضربه تا اتصال',
    'home_protect_start': 'شروع محافظت',
    'home_protect_stop': 'اتمام محافظت',
  };
}