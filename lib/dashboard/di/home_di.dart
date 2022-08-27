import 'package:get_it/get_it.dart';

import '../data/home_repository.dart';
import '../logic/home_cubit/home_cubit.dart';

class HomeDI {
  HomeDI(
    this.di, {
    HomeRepository? repository,
  }) {
    call(repository);
  }

  final GetIt di;

  void call(HomeRepository? repository) {
    di
      ..registerFactory(() => HomeCubit(di()))
      ..registerFactory(
        () => repository ?? HomeRepository(di()),
      );
  }
}
