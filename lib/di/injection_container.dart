import 'package:get_it/get_it.dart';
import 'package:troylab/dashboard/data/home_repository.dart';

import '../core/di/core_di.dart';
import '../core/logic/preferences_cubit/preferences_cubit.dart';
import '../dashboard/di/home_di.dart';

final di = GetIt.instance;

void initDependencyInjection({
  PreferencesCubit? preferencesCubit,
  HomeRepository? homeRepository,
}) {
  CoreDI(di, preferencesCubit: preferencesCubit);
  HomeDI(di, repository: homeRepository);
}
