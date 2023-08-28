import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:alvamind_library_two/widget/atom/app_button.dart';
import 'package:alvamind_library_two/widget/atom/app_card_container.dart';
import 'package:alvamind_library_two/widget/atom/app_image.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatefulWidget {
  final String? dateText;
  final String? rangeDateText;
  final String title;
  final String? subtitle;
  final String? image;
  final String? countMember;
  final bool? isDeleted;
  final double? titleSize;
  final double? subtitleSize;
  final double? imgHeight;
  final void Function()? onTapButton;

  const ProgramCard({
    super.key,
    required this.title,
    this.subtitle,
    this.isDeleted = false,
    this.onTapButton,
    this.countMember,
    this.image,
    this.dateText,
    this.rangeDateText,
    this.titleSize,
    this.subtitleSize,
    this.imgHeight,
  });

  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppCardContainer(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(AppSizes.padding),
      backgroundColor: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(4, 4),
          blurRadius: 10,
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: widget.imgHeight ?? 220,
                width: constraints.maxWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                  child: AppImage(
                    imgProvider: ImgProvider.networkImage,
                    image: widget.image ?? 'https://picsum.photos/201/300',
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.padding),
              Text(
                widget.title,
                style: AppTextStyle.bold(context, fontSize: widget.titleSize ?? 16),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.padding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.timelapse_rounded,
                        size: 12,
                        color: AppColors.baseLv4,
                      ),
                      const SizedBox(width: AppSizes.padding / 2),
                      Text(
                        widget.dateText ?? '',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 12,
                        color: AppColors.baseLv4,
                      ),
                      const SizedBox(width: AppSizes.padding / 2),
                      Text(
                        widget.rangeDateText ?? '',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: AppSizes.padding),
              Text(
                widget.subtitle ?? '',
                style: AppTextStyle.regular(context, fontSize: widget.subtitleSize ?? 14),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.padding),
              widget.isDeleted == false
                  ? Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: AppButton(
                            onTap: widget.onTapButton ??
                                () {
                                  // TODO
                                },
                            text: 'Join',
                            fontSize: 12,
                            rightIcon: Icons.arrow_right_alt_rounded,
                            buttonColor: AppColors.white,
                            textColor: AppColors.base,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSizes.padding / 2,
                              horizontal: AppSizes.padding,
                            ),
                            borderWidth: 2,
                          ),
                        ),
                        const SizedBox(width: AppSizes.padding / 2),
                        Text(
                          widget.countMember ?? '',
                          style: AppTextStyle.medium(
                            context,
                            fontSize: 14,
                            color: AppColors.baseLv4,
                          ),
                        )
                      ],
                    )
                  : AppButton(
                      onTap: widget.onTapButton ??
                          () {
                            // TODO
                          },
                      textColor: widget.isDeleted == false ? AppColors.primary : AppColors.red,
                      text: widget.isDeleted == false ? 'Lihat Detail' : 'Hapus',
                      buttonColor: widget.isDeleted == false ? AppColors.primary.withOpacity(0.12) : AppColors.red.withOpacity(0.12),
                    ),
            ],
          );
        },
      ),
    );
  }
}
