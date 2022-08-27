import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:troylab/core/constants/assets.dart';
import 'package:troylab/dashboard/data/model/products/product_request_model.dart';
import 'package:troylab/dashboard/data/model/products/product_response_model.dart';

import '../../../core/data/api_manager.dart';
import '../../../core/utils/nullable.dart';
import '../../data/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeState());

  final HomeRepository _repository;
  Future<void> home() async {
    emit(state.copyWith(filterList: filters, filterType: filters.first));
    emit(state.requestLoading());
    final result = await _repository.home(ProductsRequestModel(page: 1));
    emit(
      result.fold(
        (l) => state.requestFailed(l),
        (r) {
          return state.requestSuccess(r);
        },
      ),
    );
  }

  void bottomTabChanged(int position, ChangingTabsSource source) {
    emit(state.copyWith(currentTab: HomeTabs.values[position], source: source));
  }

  void retry() {
    home();
  }

  void onSelection(FilterType? filterList) {
    emit(state.copyWith(filterType: filterList));
  }
}
