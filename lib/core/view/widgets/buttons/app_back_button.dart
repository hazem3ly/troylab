import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/assets.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      splashRadius: 20,
      onPressed: onPressed ??
          () {
            FocusScope.of(context).unfocus();
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
      icon: SvgPicture.asset(
        Assets.back,
        color: AppColors.black,
      ),
    );
  }
}
