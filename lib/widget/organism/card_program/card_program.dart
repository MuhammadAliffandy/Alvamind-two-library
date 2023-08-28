import 'package:alvamind_library_two/widget/atom/app_button.dart';
import 'package:alvamind_library_two/widget/atom/app_card_container.dart';
import 'package:alvamind_library_two/widget/molecule/app_tooltip.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/my_icon_button.dart';

class CardProgram extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? bottomTitle;
  final String? bottomsubtitle;
  final String? toolTipTitle;
  final String? toolTipsubtitle;
  final IconData? iconProgram;
  final Color? backgroundColorIcon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? bottomTitleColor;
  final Color? bottomSubtitleColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? subtitleSize;
  final bool? withButton;
  final EdgeInsets? paddingToolTip;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;
  final Widget? customWidgetRightIcon;
  final void Function()? onTapCard;
  final void Function()? onTapInfo;
  final void Function()? onTapButton;

  const CardProgram({
    super.key,
    this.title,
    this.bottomTitle,
    this.bottomSubtitleColor,
    this.bottomTitleColor,
    this.bottomsubtitle,
    this.subtitle,
    this.iconProgram,
    this.onTapCard,
    this.onTapInfo,
    this.boxShadow,
    this.toolTipTitle,
    this.toolTipsubtitle,
    this.paddingToolTip,
    this.backgroundColor,
    this.backgroundColorIcon,
    this.iconColor,
    this.subtitleColor,
    this.titleColor,
    this.subtitleSize,
    this.withButton = false,
    this.onTapButton,
    this.customWidgetRightIcon,
    this.padding,
  });

  @override
  State<CardProgram> createState() => _CardProgramState();
}

class _CardProgramState extends State<CardProgram> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius * 2),
        boxShadow: widget.boxShadow ?? [],
      ),
      child: Padding(
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: AppSizes.padding,
              vertical: AppSizes.padding,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIconButton(
                  onPressed: () {
                    // TODO
                  },
                  icon: widget.iconProgram ?? Icons.campaign_rounded,
                  iconSize: 24,
                  iconColor: widget.iconColor ?? null,
                  backgroundColor: widget.backgroundColorIcon ?? AppColors.baseLv7,
                  padding: const EdgeInsets.all(AppSizes.padding / 1.5),
                ),
                widget.customWidgetRightIcon != null
                    ? widget.customWidgetRightIcon!
                    : AppTooltip(
                        arrowLength: 0,
                        child: Icon(
                          Icons.info_outline,
                          size: 20,
                          color: widget.withButton == true ? AppColors.white : AppColors.baseLv5,
                        ),
                        content: Padding(
                          padding: widget.paddingToolTip ?? const EdgeInsets.only(right: AppSizes.padding * 8),
                          child: SizedBox(
                            width: 260,
                            child: AppCardContainer(
                              margin: EdgeInsets.all(0),
                              boxShadow: widget.withButton == true
                                  ? [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        color: AppColors.baseLv2.withOpacity(0.12),
                                        blurRadius: 20,
                                      )
                                    ]
                                  : const [
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        color: AppColors.baseLv6,
                                        blurRadius: 30,
                                      )
                                    ],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.toolTipTitle ?? '',
                                    style: AppTextStyle.medium(
                                      context,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: AppSizes.padding / 2),
                                  Text(
                                    widget.toolTipsubtitle ?? '',
                                    style: AppTextStyle.regular(
                                      context,
                                      fontSize: 14,
                                      color: AppColors.baseLv5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              widget.title ?? '',
              style: AppTextStyle.bold(
                context,
                fontSize: 18,
                color: widget.titleColor ?? AppColors.baseLv4,
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Text(
              widget.subtitle ?? '',
              style: AppTextStyle.extraBold(
                context,
                fontSize: widget.subtitleSize ?? 36,
                color: widget.subtitleColor ?? null,
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            widget.withButton == true
                ? AppButton(
                    text: 'Withdraw',
                    fontSize: 16,
                    buttonColor: AppColors.white,
                    textColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding,
                      vertical: AppSizes.padding / 1.5,
                    ),
                    onTap: widget.onTapButton ??
                        () {
                          // TODO
                        },
                  )
                : Row(
                    children: [
                      Text(widget.bottomTitle ?? '',
                          style: AppTextStyle.bold(
                            context,
                            fontSize: 16,
                            color: widget.bottomTitleColor ?? Color(0xFF36D362),
                          )),
                      const SizedBox(
                        width: AppSizes.padding / 2,
                      ),
                      Text(
                        widget.bottomsubtitle ?? '',
                        style: AppTextStyle.medium(
                          context,
                          fontSize: 16,
                          color: AppColors.baseLv5,
                        ),
                      ),
                    ],
                  ),
            widget.withButton == true ? const SizedBox.shrink() : const SizedBox(height: AppSizes.padding / 8),
          ],
        ),
      ),
    );
  }
}
