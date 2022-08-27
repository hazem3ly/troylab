import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:troylab/core/constants/assets.dart';
import 'package:troylab/core/services/loader.dart';
import 'package:troylab/core/utils/utils.dart';
import 'package:troylab/core/view/widgets/buttons/app_button.dart';
import 'package:troylab/core/view/widgets/image_loader.dart';
import 'package:troylab/core/view/widgets/text_fields/app_text_field.dart';
import 'package:troylab/dashboard/logic/home_cubit/home_cubit.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/logic/preferences_cubit/preferences_cubit.dart';
import '../../../core/view/widgets/app_screen.dart';
import 'package:troylab/l10n/l10n.dart';

import '../widgets/app_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const id = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.loading ? Loader.instance.show(context) : Loader.instance.hide();
      },
      child: AppScreen(
        bottomNavigationBar: const AppBottomNavigationBar(),
        child: Container(
          // padding: EdgeInsets.all(16.r),
          width: double.infinity,
          // height: 250.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                AppColors.dark_grey_blue,
                AppColors.blue_green,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.notificationIcon),
                    Image.asset(Assets.maqsafiLogo),
                    SizedBox(width: 16.w),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Image.asset(Assets.notRegistered),
                    SizedBox(width: 10.w),
                    Image.asset(Assets.searchByNumber),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: AppTextField(
                        hintKey: context.l10n.student_name,
                        prefixIcon: Image.asset(Assets.search),
                        textInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: AppColors.athensGray,
                        ),
                        child: Tabs(
                          currentTab: state.currentTab,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required this.currentTab,
  }) : super(key: key);
  final HomeTabs currentTab;
  @override
  Widget build(BuildContext context) {
    switch (currentTab) {
      case HomeTabs.home:
        return const HomeTab();
      case HomeTabs.search:
        return AppButton(
          onPressed: () {
            context.read<PreferencesCubit>().toggleLanguage();
          },
          textKey: 'Change language',
        );
      case HomeTabs.categories:
      case HomeTabs.cart:
      case HomeTabs.more:
        return Text(currentTab.toString());
    }
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColors.athensGray,
            width: double.infinity,
            height: 100,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.filterType != current.filterType,
              builder: (context, state) {
                return ListView.separated(
                  padding: const EdgeInsets.all(18),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: state.filterList?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.read<HomeCubit>().onSelection(
                              state.filterList?[index],
                            );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: (state.filterType?.id ==
                                  state.filterList?[index].id)
                              ? AppColors.blue_green
                              : AppColors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              state.filterList?[index].title ?? '',
                              style: TextStyle(
                                color: (state.filterType?.id ==
                                        state.filterList?[index].id)
                                    ? AppColors.white
                                    : AppColors.blue_green,
                                fontStyle: FontStyle.normal,
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (notNullNorEmpty(state.filterList?[index].icon))
                              const SizedBox(width: 10),
                            if (notNullNorEmpty(state.filterList?[index].icon))
                              Image.asset(state.filterList?[index].icon ?? '')
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.response != current.response,
            builder: (context, state) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  mainAxisExtent: 180,
                ),
                padding: const EdgeInsets.all(18),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.response?.products.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                              '${state.response?.products[index].calories} Kcal'),
                          ImageLoader(
                            imageUrl: state.response?.products[index].image,
                          ),
                          const SizedBox(height: 10),
                          Text(state.response?.products[index].name ?? '')
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
