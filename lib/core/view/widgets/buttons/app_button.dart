import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.textKey,
    required this.onPressed,
    this.height,
    this.width,
    this.mainButton = true,
    this.margin,
    this.child,
    this.color,
    this.isLoading = false,
  }) : super(key: key);

  final String textKey;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final bool mainButton;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return Container(
      width: width ?? double.infinity,
      margin: margin ?? EdgeInsets.zero,
      height: height ?? 50,
      decoration: mainButton
          ? null
          : BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: onPressed == null
                    ? AppColors.brownishGrey
                    : AppColors.primary,
              ),
            ),
      child: MaterialButton(
        color: color ?? (mainButton ? AppColors.primary : AppColors.white),
        onPressed: onPressed,
        disabledColor: mainButton ? AppColors.brownishGrey : AppColors.paleGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColors.white,
              )
            : child ??
                FittedBox(
                  child: Text(
                    textKey,
                    style: mainButton
                        ? TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                            fontSize: 14.0.sp,
                          )
                        : TextStyle(
                            color: AppColors.cherryRed,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                            fontSize: 14.0.sp,
                          ),
                  ),
                ),
      ),
    );
  }
}
