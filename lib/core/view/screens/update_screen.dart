import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_colors.dart';
import '../../constants/assets.dart';
import '../widgets/app_screen.dart';
import '../widgets/buttons/app_button.dart';
import 'package:troylab/l10n/l10n.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  static const id = '/update-screen';

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
            children: [
              const Spacer(),
              Image.asset(
                Assets.rocket,
                width: 200.w,
              ),
              const SizedBox(height: 24),
              Text(
                context.l10n.update_available,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                context.l10n.new_version_of_the_app_is_available,
                style: const TextStyle(
                  color: AppColors.blueGrey,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppButton(
                textKey: context.l10n.update,
                onPressed: () async {
                  if (Platform.isAndroid) {
                    await launchUrl(Uri.parse(
                        'https://play.google.com/store/apps/details?id=com.crcleaders.zumra'));
                  } else if (Platform.isIOS) {
                    await launchUrl(
                        Uri.parse('https://apps.apple.com/app/id1591794566'));
                  }
                },
              ),
              const SafeArea(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
