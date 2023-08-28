import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';

class AppTabbar extends StatelessWidget {
  final TabController? controller;
  final List<String>? text;
  final List<Widget>? icon;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? height;

  const AppTabbar({
    super.key,
    this.controller,
    this.icon,
    this.text,
    this.padding,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: text?.length ?? 1,
      child: Container(
        padding: padding ?? const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.baseLv6,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TabBar(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          labelColor: AppColors.base,
          indicator: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          tabs: [
            ...List.generate(text?.length ?? 1, (index) {
              return Tab(
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon?[index] ??
                        Image.asset(
                          AppAssets.personFormIconPath,
                        ),
                    const SizedBox(width: AppSizes.padding / 3),
                    Flexible(
                      child: Text(
                        text?[index] ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle ?? AppTextStyle.bold(context, fontSize: 12),
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
