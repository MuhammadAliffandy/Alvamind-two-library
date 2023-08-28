import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppTextField extends StatelessWidget {
  final String? lableText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardtype;
  final bool enabled;
  final bool obscureText;
  final Color? fillColor;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.lableText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardtype,
    this.enabled = true,
    this.obscureText = false,
    this.onTap,
    this.onChanged,
    this.padding,
    this.contentPadding,
    this.controller,
    this.textInputAction,
    this.inputFormatters,
    this.fillColor,
    this.enabledBorder,
    this.border,
    this.hintStyle,
    this.labelStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: AppSizes.padding,
              vertical: AppSizes.padding / 2,
            ),
        child: TextField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: keyboardtype,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          style: style ??
              AppTextStyle.medium(
                context,
                color: AppColors.base,
                fontSize: 16,
              ),
          decoration: InputDecoration(
            labelText: lableText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: fillColor ?? AppColors.transparent,
            enabledBorder: enabledBorder,
            border: border ?? InputBorder.none,
            labelStyle: labelStyle ??
                AppTextStyle.medium(
                  context,
                  color: AppColors.baseLv4,
                  fontSize: 14,
                ),
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: hintStyle ??
                AppTextStyle.medium(
                  context,
                  color: AppColors.baseLv4,
                  fontSize: 14,
                ),
          ),
        ),
      ),
    );
  }
}
