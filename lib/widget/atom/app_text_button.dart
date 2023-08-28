import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final void Function() onTap;

  const AppTextButton({
    super.key,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.textStyle,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.person_outline,
              size: iconSize ?? 16,
              color: iconColor ?? AppColors.base,
            ),
            const SizedBox(
              width: AppSizes.padding / 3,
            ),
            Text(
              text,
              style: textStyle ?? AppTextStyle.bold(context, fontSize: 14),
            )
          ],
        ));
  }
}
