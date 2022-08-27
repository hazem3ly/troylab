import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/assets.dart';
import '../../logic/home_cubit/home_cubit.dart';
import 'package:troylab/l10n/l10n.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        border: Border.all(color: AppColors.lightPeriwinkle, width: 0.5),
        color: AppColors.white,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return BottomNavigationBar(
              selectedItemColor: AppColors.blue_green,
              currentIndex: state.currentTab.index,
              onTap: (position) {
                context
                    .read<HomeCubit>()
                    .bottomTabChanged(position, ChangingTabsSource.bottomBar);
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              
              selectedLabelStyle: const TextStyle(
                color: AppColors.blue_green,
                fontWeight: FontWeight.w500,
                height: 1.0,
                fontSize: 12.0,
              ),
              unselectedLabelStyle: const TextStyle(
                color: AppColors.pinkishGrey,
                fontWeight: FontWeight.w400,
                height: 1.0,
                fontSize: 12.0,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Assets.house,
                    key: const Key('bottom_bar_home'),
                    color: AppColors.brown_grey,
                    width: 25,
                    height: 25,
                  ),
                  activeIcon: Image.asset(
                    Assets.house,
                    key: const Key('bottom_bar_home'),
                    color: AppColors.blue_green,
                    width: 25,
                    height: 25,
                  ),
                  label: context.l10n.home,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Assets.wallet,
                    key: const Key('bottom_bar_wishlist'),
                    color: AppColors.brown_grey,
                    width: 25,
                    height: 25,
                  ),
                  activeIcon: Image.asset(
                    Assets.wallet,
                    color: AppColors.blue_green,
                    key: const Key('bottom_bar_wishlist'),
                    width: 25,
                    height: 25,
                  ),
                  label: context.l10n.wallet,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Assets.noun_document,
                    key: const Key('bottom_bar_categories'),
                    width: 25,
                    height: 25,
                  ),
                  activeIcon: Image.asset(
                    Assets.noun_document,
                    color: AppColors.blue_green,
                    key: const Key('bottom_bar_categories'),
                    width: 25,
                    height: 25,
                  ),
                  label: context.l10n.selling,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Assets.cart_check,
                    key: const Key('bottom_bar_categories'),
                    width: 25,
                    height: 25,
                  ),
                  activeIcon: Image.asset(
                    Assets.cart_check,
                    color: AppColors.blue_green,
                    width: 25,
                    height: 25,
                  ),
                  label: context.l10n.cart,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    Assets.three_dots,
                    key: const Key('bottom_bar_more'),
                    width: 25,
                    height: 25,
                  ),
                  activeIcon: Image.asset(
                    Assets.three_dots,
                    color: AppColors.blue_green,
                    key: const Key('bottom_bar_more'),
                    width: 25,
                    height: 25,
                  ),
                  label: context.l10n.more,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
