import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  AppSharedPreferences._();

  static final _instance = AppSharedPreferences._();
  static AppSharedPreferences get instance => _instance;

  late SharedPreferences preferences;
  bool? userChooseLanguage;
  bool? walkthroughScreenShown;
  int? latestAppVersion;
  int surveyShown = 0;

  Future<void> loadPreferences() async {
    final instance = await SharedPreferences.getInstance();
    preferences = instance;
    userChooseLanguage = preferences.getBool('userChooseLanguage');
    walkthroughScreenShown = preferences.getBool('walkthroughScreenShown');
    latestAppVersion = preferences.getInt('latestAppVersion');
    surveyShown = preferences.getInt('surveyShown') ?? 0;
  }

  Future<void> setUserChooseLanguage() async {
    userChooseLanguage = true;
    await preferences.setBool('userChooseLanguage', true);
  }

  Future<void> setWalkthroughScreenShown() async {
    walkthroughScreenShown = true;
    await preferences.setBool('walkthroughScreenShown', true);
  }

  Future<void> setLatestAppVersion(int version) async {
    latestAppVersion = version;
    await preferences.setInt('latestAppVersion', version);
  }

  Future<void> incrementSurveyShown() async {
    surveyShown++;
    await preferences.setInt('surveyShown', surveyShown);
  }

  Future<void> removeLatestAppVersion() async {
    latestAppVersion = null;
    await preferences.remove('latestAppVersion');
  }

  Future<bool> clearSharedPreferences() async {
    userChooseLanguage = null;
    walkthroughScreenShown = null;
    latestAppVersion = null;
    return preferences.clear();
  }
}
