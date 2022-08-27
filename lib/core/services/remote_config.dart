import 'dart:async';

import 'package:flutter/material.dart';

class AppRemoteConfig {
  AppRemoteConfig._();

  static final _instance = AppRemoteConfig._();
  static AppRemoteConfig get instance => _instance;


  bool _showPromotionalProducts = false;
  bool get showPromotionalProducts =>
      didLoadRemoteConfig.isCompleted && _showPromotionalProducts;
  bool _showCateogriesList = true;
  bool get showCateogriesList =>
      didLoadRemoteConfig.isCompleted && _showCateogriesList;
  bool _showPromotionalCategory = true;
  bool get showPromotionalCategory =>
      didLoadRemoteConfig.isCompleted && _showPromotionalCategory;
  bool _enableShareReport = false;
  bool get enableShareReport =>
      didLoadRemoteConfig.isCompleted && _enableShareReport;
  bool _enableFirebasePerformance = false;
  bool get enableFirebasePerformance =>
      didLoadRemoteConfig.isCompleted && _enableFirebasePerformance;
  bool _enableSmartLook = false;
  bool get enableSmartLook =>
      didLoadRemoteConfig.isCompleted && _enableSmartLook;
  int _showSurveyXTimes = 0;
  int get showSurveyXTimes =>
      didLoadRemoteConfig.isCompleted ? _showSurveyXTimes : 0;

  Completer didLoadRemoteConfig = Completer();

  Future<void> setupRemoteConfig(BuildContext context) async {
    _setConfigSettings();
    checkForUpdates(context);
    Future.delayed(const Duration(seconds: 10)).then((_) {
      if (didLoadRemoteConfig.isCompleted) return;
      didLoadRemoteConfig.complete();
    });
  }

  Future<void> _setConfigSettings() async {
  }

  void checkForUpdates(BuildContext context) {
  }
}
