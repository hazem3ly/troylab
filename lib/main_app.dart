import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/app.dart';
import 'core/flavors.dart';
import 'core/services/app_logger.dart';
import 'di/injection_container.dart';

Future<void> runMainApp(Flavors flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppFlavor.appFlavor = flavor;
  initDependencyInjection();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  // Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    AppLogger.instance.log(
      details.exceptionAsString(),
      logLevel: LogLevel.error,
      stackTrace: details.stack,
    );
  };
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runZonedGuarded(
    () => HydratedBlocOverrides.runZoned(
      () => runApp(const MainApp()),
      storage: storage,
    ),
    (error, stackTrace) {
      AppLogger.instance.log(
        error.toString(),
        logLevel: LogLevel.error,
        stackTrace: stackTrace,
      );
    },
  );
}
