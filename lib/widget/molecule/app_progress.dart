import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppProgress extends StatelessWidget {
  final String? labelLeft;
  final String? labelRight;
  final TextStyle? labelLeftStyle;
  final TextStyle? labelRightStyle;
  final Color? progressColor;
  final Color? progressBackgroundColor;
  final num percent;
  final double? height;

  const AppProgress({
    super.key,
    this.labelLeft,
    this.labelRight,
    this.labelLeftStyle,
    this.labelRightStyle,
    this.progressBackgroundColor,
    this.progressColor,
    this.height,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) {
        // TODO
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height ?? 24,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: progressBackgroundColor ?? AppColors.baseLv7,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                height: 24,
                width: constraints.maxWidth * percent / 100,
                decoration: BoxDecoration(
                  color: progressColor ?? AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  labelLeft ?? 'label',
                  style: labelLeftStyle ??
                      AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                ),
                Text(
                  labelRight != null ? labelRight! : '${percent}%',
                  style: labelRightStyle ??
                      AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
