import 'package:flutter/material.dart';
import 'package:troylab/core/constants/app_colors.dart';

import '../../../core/constants/assets.dart';
import '../../../core/view/widgets/app_screen.dart';
import '../dashboard/view/screens/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const id = '/';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => navigateToNextScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: SafeArea(
        child: Container(
          color: AppColors.white,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              Assets.animatedLogo,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToNextScreen() {
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }
}
