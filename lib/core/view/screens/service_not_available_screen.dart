import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/assets.dart';
import '../widgets/app_screen.dart';
import 'package:troylab/l10n/l10n.dart';

class ServiceNotAvailableScreen extends StatelessWidget {
  const ServiceNotAvailableScreen({Key? key}) : super(key: key);

  static const id = '/service-not-available-screen';

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      transparentAppBar: true,
      leading: Container(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Padding(
          padding: EdgeInsets.all(50.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.maintenance,
                width: 200.w,
              ),
              const SizedBox(height: 24),
              const Text(
                'service_under_maintenance',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'we_are_working_on_it',
                style: TextStyle(
                  color: AppColors.blueGrey,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
