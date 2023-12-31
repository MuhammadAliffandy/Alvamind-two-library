import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';

// ignore: must_be_immutable
class MyInviteButton extends StatelessWidget {
  MyInviteButton({
    super.key,
    this.textButton,
    this.leadingButton,
    required this.functionButton,
  });

  dynamic functionButton;
  String? textButton;
  Widget? leadingButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: functionButton,
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.baseLv7),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              leadingButton!,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 3),
                child: Text(
                  textButton!,
                  style: AppTextStyle.regular(
                    context,
                    color: AppColors.base,
                    fontSize: 14,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_outlined,
                color: AppColors.base,
                size: 18,
              )
            ],
          ),
        ));
  }
}
