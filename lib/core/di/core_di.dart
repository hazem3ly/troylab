import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/api_manager.dart';

import '../logic/preferences_cubit/preferences_cubit.dart';

class CoreDI {
  CoreDI(this.di, {PreferencesCubit? preferencesCubit}) {
    call(preferencesCubit: preferencesCubit);
  }

  final GetIt di;

  void call({PreferencesCubit? preferencesCubit}) {
    final List<Interceptor> interceptors = [];
    di
      ..registerLazySingleton(
        () => APIsManager(
          interceptors: interceptors,
        ),
      )
      ..registerLazySingleton(() => preferencesCubit ?? PreferencesCubit());
  }
}
