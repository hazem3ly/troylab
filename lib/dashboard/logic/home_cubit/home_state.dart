part of 'home_cubit.dart';

enum ChangingTabsSource { bottomBar, pageViewer }

enum HomeTabs { home, search, categories, cart, more }

class FilterType {
  final int id;
  final String title;
  final String? icon;

  FilterType({
    required this.id,
    required this.title,
    this.icon,
  });
}

final filters = [
  FilterType(id: 1, title: 'الكل'),
  FilterType(id: 2, title: 'بيتزا', icon: Assets.cart_check),
  FilterType(id: 3, title: 'ساندوتشات', icon: Assets.cart_check),
  FilterType(id: 4, title: 'مشروبات', icon: Assets.cart_check),
  FilterType(id: 5, title: 'بيبسي', icon: Assets.cart_check),
];

class HomeState extends Equatable {
  const HomeState({
    this.loading = false,
    this.failure,
    this.response,
    this.currentTab = HomeTabs.home,
    this.source = ChangingTabsSource.bottomBar,
    this.filterType,
    this.filterList,
  });

  final bool loading;
  final Failure? failure;
  final ProductsResponseModel? response;
  final HomeTabs currentTab;
  final ChangingTabsSource source;
  final FilterType? filterType;
  final List<FilterType>? filterList;

  HomeState requestSuccess(ProductsResponseModel response) =>
      copyWith(loading: false, response: Nullable(response));

  HomeState requestFailed(Failure failure) =>
      copyWith(loading: false, failure: Nullable(failure));

  HomeState requestLoading() =>
      copyWith(loading: true, failure: Nullable(null));

  HomeState copyWith({
    bool? loading,
    Nullable<Failure?>? failure,
    Nullable<ProductsResponseModel?>? response,
    HomeTabs? currentTab,
    ChangingTabsSource? source,
    FilterType? filterType,
    List<FilterType>? filterList,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure == null ? this.failure : failure.value,
      response: response == null ? this.response : response.value,
      currentTab: currentTab ?? this.currentTab,
      source: source ?? this.source,
      filterType: filterType ?? this.filterType,
      filterList: filterList ?? this.filterList,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        failure,
        response,
        currentTab,
        source,
        filterType,
        filterList,
      ];
}
