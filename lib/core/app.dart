import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router.dart';
import '../dashboard/logic/home_cubit/home_cubit.dart';
import '../di/injection_container.dart';
import '../onboarding/splash.dart';
import 'package:troylab/l10n/l10n.dart';
import 'constants/app_theme.dart';
import 'data/api_manager.dart';
import 'flavors.dart';
import 'logic/preferences_cubit/preferences_cubit.dart';
import 'services/alert.dart';
import 'services/app_locale.dart';
import 'services/app_logger.dart';
import 'services/app_shared_preferences.dart';
import 'services/remote_config.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key, this.home}) : super(key: key);
  final Widget? home;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<PreferencesCubit>(),
        ),
        BlocProvider(
          create: (context) => di<HomeCubit>(),
        ),
      ],
      child: App(home: home),
    );
  }
}

Function? showUpdateDialogCallback;

class App extends StatefulWidget {
  const App({Key? key, this.home}) : super(key: key);

  final Widget? home;

  @override
  _AppState createState() => _AppState();

  static Future<void> rebirth(BuildContext context) async {
    context.findAncestorStateOfType<_AppState>()?.restart();
  }
}

class _AppState extends State<App> {
  Key _key = UniqueKey();
  Widget? _updateAvailableOrServiceDown;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PreferencesCubit, PreferencesState>(
          listenWhen: (previous, current) =>
              previous.language != null &&
              previous.language != current.language,
          listener: (context, state) => restart(),
        ),
      ],
      child: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) => MaterialApp(
              key: _key,
              builder: builder,
              title: AppFlavor.title,
              theme: state.darkTheme ? AppTheme.dark : AppTheme.light,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeResolutionCallback: (locale, supportedLocales) =>
                  AppLocale.setAppLocale(
                      locale, supportedLocales, context, state.language),
              onGenerateRoute: AppRouter.onGenerateRoute,
              home: child,
            ),
            child: _updateAvailableOrServiceDown ?? _Home(home: widget.home),
          );
        },
      ),
    );
  }

  Widget builder(BuildContext context, Widget? widget) {
    if (widget == null) return Container();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: widget,
    );
  }

  void restart() {
    setState(() {
      Alert.newInstance();
      AppLogger.newInstance();
      _key = UniqueKey();
    });
  }
}

class _Home extends StatefulWidget {
  const _Home({Key? key, this.home}) : super(key: key);

  final Widget? home;

  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> with WidgetsBindingObserver {
  final deviceInfo = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // context.read<UserCubit>();
    AppSharedPreferences.instance.loadPreferences();
    BaseRequestDefaults.instance.setBaseUrl(AppFlavor.baseUrl);
    BaseRequestDefaults.instance.addHeader('User-Agent', 'Mobile');
    AppRemoteConfig.instance.setupRemoteConfig(context);
    if (Platform.isAndroid) {
      deviceInfo.androidInfo.then((value) {
        if (value.androidId != null) {
          BaseRequestDefaults.instance.addHeader('uuid', value.androidId!);
        }
      });
    } else if (Platform.isIOS) {
      deviceInfo.iosInfo.then((value) {
        if (value.identifierForVendor != null) {
          BaseRequestDefaults.instance
              .addHeader('uuid', value.identifierForVendor!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.home ?? const Splash();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
