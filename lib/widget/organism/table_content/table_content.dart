import 'package:alvamind_library_two/app/asset/app_assets.dart';

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../molecule/app_checkbox.dart';

class TableContent extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? image;
  final IconData? icon;
  final Color? iconColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? titleSize;
  final double? subtitleSize;
  final double? iconSize;
  final bool? withIcon;
  final bool? isChecked;
  final bool? checkedValue;
  final bool? isCustomWidget;
  final Widget? customWidget;
  final TextStyle? titleTextStyle;
  final void Function(bool)? onChangeChecked;

  const TableContent({
    super.key,
    required this.title,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.subtitle,
    this.subtitleColor,
    this.subtitleSize,
    this.titleColor,
    this.titleSize,
    this.withIcon = false,
    this.isChecked = false,
    this.onChangeChecked,
    this.checkedValue,
    this.image,
    this.titleTextStyle,
    this.isCustomWidget = false,
    this.customWidget,
  });

  @override
  State<TableContent> createState() => _TableContentState();
}

bool check = false;

class _TableContentState extends State<TableContent> {
  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding / 2),
          child: Row(
            children: [
              widget.isChecked == true
                  ? AppCheckbox(
                      value: widget.checkedValue != null ? widget.checkedValue : check,
                      onChanged: (value) {
                        check = !check;
                        setState(() {});
                        widget.onChangeChecked!(value!);
                      },
                      activeColor: AppColors.baseLv5)
                  : const SizedBox.shrink(),
              widget.isChecked == true ? const SizedBox(width: AppSizes.padding / 2) : const SizedBox.shrink(),
              widget.isCustomWidget == true
                  ? widget.customWidget!
                  : widget.image == null
                      ? const SizedBox.shrink()
                      : Image.network(
                          widget.image ?? AppAssets.fileIconPath,
                          scale: 4.0,
                        ),
              widget.isCustomWidget == true
                  ? const SizedBox(
                      width: AppSizes.padding / 2,
                    )
                  : widget.image != null
                      ? const SizedBox(width: AppSizes.padding / 2)
                      : const SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.withIcon == false
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            widget.icon ?? Icons.circle,
                            size: widget.iconSize ?? 16,
                            color: widget.iconColor ?? Color(0xFF36D362),
                          ),
                        ),
                  widget.withIcon == false ? const SizedBox.shrink() : const SizedBox(width: AppSizes.padding / 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: widget.titleTextStyle ??
                            AppTextStyle.bold(
                              context,
                              fontSize: widget.titleSize ?? 16,
                              color: widget.titleColor ?? AppColors.black,
                            ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      widget.subtitle == null ? const SizedBox.shrink() : const SizedBox(height: AppSizes.padding / 2),
                      widget.subtitle == null
                          ? const SizedBox.shrink()
                          : Text(
                              widget.subtitle ?? '',
                              style: AppTextStyle.regular(
                                context,
                                fontSize: widget.subtitleSize ?? 12,
                                color: widget.subtitleColor ?? AppColors.baseLv4,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(width: AppSizes.padding)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
