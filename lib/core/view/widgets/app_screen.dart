import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.title,
    this.transparentAppBar,
    this.transparentStatusBar,
    this.displayActions = false,
    this.actions,
    this.leading,
    this.floatingActionButton,
  }) : super(key: key);

  final Widget child;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final String? title;
  final bool? transparentAppBar;
  final bool? transparentStatusBar;
  final bool displayActions;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.athensGray,
      body: child,
      appBar: buildAppBar(context),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  List<Widget> buildActions(BuildContext context) {
    if (actions != null) {
      return actions!;
    }
    if (displayActions) {
      return [
        // const CartIcon(color: AppColors.black),
        // if (signedInUser)
        //   IconButton(
        //     onPressed: () =>
        //         Navigator.of(context).pushNamed(NotificationsScreen.id),
        //     icon: SvgPicture.asset(Assets.notification),
        //   ),
      ];
    }
    return [];
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    if (appBar != null) {
      return appBar!;
    }
    if (title != null || transparentAppBar != null) {
      // return getAppbar(
      //   context,
      //   title: title,
      //   leading: leading,
      //   transparent: transparentAppBar,
      //   actions: buildActions(context),
      // );
    }
    return null;
  }
}
