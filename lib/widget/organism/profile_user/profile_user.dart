import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';

import '../../atom/my_icon_button.dart';

class ProfileUser extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? image;
  final IconData? icon;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? backgroundColor;
  final double? imageSize;
  final double? iconSize;
  final double? borderRadius;
  final EdgeInsets? padding;
  final void Function(bool) onTap;

  const ProfileUser({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.image,
    this.imageSize,
    this.subtitleTextStyle,
    this.titleTextStyle,
    this.padding,
    this.iconSize,
    this.icon,
  });

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
      ),
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              backgroundImage: NetworkImage(widget.image ?? 'https://picsum.photos/200/300'),
              maxRadius: widget.imageSize ?? 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: widget.titleTextStyle ??
                      AppTextStyle.bold(
                        context,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: AppSizes.padding / 3),
                Text(
                  widget.subtitle,
                  style: widget.subtitleTextStyle ??
                      AppTextStyle.regular(
                        context,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
            AppIconButton(
              icon: widget.icon ?? Icons.keyboard_arrow_down,
              iconSize: 18,
              padding: EdgeInsets.all(0),
              onPressed: () {
                // TODO

                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
