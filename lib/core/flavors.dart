import 'dart:io';

import 'logic/preferences_cubit/preferences_cubit.dart';

bool get mockApp => AppFlavor.appFlavor == Flavors.mock;
bool testMode = Platform.environment.containsKey('FLUTTER_TEST');
bool productionEnvironment = AppFlavor.appFlavor == Flavors.production;
bool developmentEnvironment = AppFlavor.appFlavor == Flavors.development;
bool stagingEnvironment = AppFlavor.appFlavor == Flavors.staging;

enum Flavors {
  production,
  development,
  staging,
  mock,
}

class AppFlavor {
  static late Flavors appFlavor = Flavors.development;

  static String get title {
    switch (appFlavor) {
      case Flavors.production:
        return 'Zumrafood';
      case Flavors.development:
        return 'Zumra Development';
      case Flavors.staging:
        return 'Zumra Staging';
      case Flavors.mock:
        return 'Zumra Mock';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavors.production:
        return 'https://bridge.zumrafood.com/';
      case Flavors.development:
        return 'https://bridge-dev.zumrafood.com/';
      case Flavors.staging:
        return 'https://bridge-staging.zumrafood.com/';
      case Flavors.mock:
        return 'http://localhost/';
    }
  }

  static String get adjustKey {
    switch (appFlavor) {
      case Flavors.production:
        return 'bfb9mukf7jls';
      case Flavors.development:
        return '29y01raoucqo';
      case Flavors.staging:
        return 'cxq7qjqnjqjq';
      case Flavors.mock:
        return 'cxq7qjqnjqjq';
    }
  }

  static String get dynamicLinkUriPrefix {
    switch (appFlavor) {
      case Flavors.production:
        return 'https://zumrafood.page.link';
      case Flavors.development:
        return 'https://zumradev.page.link';
      case Flavors.staging:
        return 'https://zumradev.page.link';
      case Flavors.mock:
        return 'https://zumradev.page.link';
    }
  }

  static String get privacyUrl =>
      'https://www.zumrafood.com/$languageName/privacy-policy';
  static String get termsUrl =>
      'https://www.zumrafood.com/$languageName/terms-conditions';
  static String get customerService =>
      'https://www.zumrafood.com/$languageName/customer-service';
  static String get faqs => 'https://www.zumrafood.com/$languageName/faqs';
  static String get aboutUs =>
      'https://www.zumrafood.com/$languageName/about-us';
}
