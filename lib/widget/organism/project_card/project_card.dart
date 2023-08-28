import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:alvamind_library_two/widget/atom/app_button.dart';
import 'package:alvamind_library_two/widget/atom/app_card_container.dart';
import 'package:alvamind_library_two/widget/atom/app_image.dart';
import 'package:alvamind_library_two/widget/molecule/app_progress.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String? dateText;
  final String? subtitle;
  final String? rangeDateText;
  final String? countInvestment;
  final String? rangeInvestment;
  final String? image;
  final String? countInvestor;
  final String? countStar;
  final String? tagText;
  final Color? tagColor;
  final Color? tagTextColor;
  final double? subtitleSize;
  final double? titleSize;
  final bool? isDeleted;
  final num? percentProgress;
  final double? imgHeight;
  final void Function()? onTapButton;

  const ProjectCard({
    super.key,
    required this.title,
    this.subtitle,
    this.isDeleted = false,
    this.onTapButton,
    this.countInvestor,
    this.image,
    this.dateText,
    this.countStar,
    this.countInvestment,
    this.rangeDateText,
    this.rangeInvestment,
    this.tagColor,
    this.tagText,
    this.tagTextColor,
    this.percentProgress,
    this.titleSize,
    this.subtitleSize,
    this.imgHeight,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
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
              Stack(
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: widget.imgHeight ?? 220,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                      child: AppImage(
                        imgProvider: ImgProvider.networkImage,
                        image: widget.image ?? 'https://picsum.photos/201/300',
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.padding / 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppButton(
                            onTap: () {
                              // TODO
                            },
                            text: widget.tagText ?? '',
                            fontSize: 12,
                            textColor: widget.tagTextColor ?? AppColors.white,
                            buttonColor: widget.tagColor ?? AppColors.yellow,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSizes.padding / 4,
                              horizontal: AppSizes.padding / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyle.bold(context, fontSize: widget.titleSize ?? 16),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      SizedBox(width: AppSizes.padding / 6),
                      Text(
                        widget.countStar ?? '',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: 14,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.padding / 1.5),
              Text(
                widget.subtitle ?? '',
                style: AppTextStyle.regular(context, fontSize: widget.subtitleSize ?? 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              const SizedBox(height: AppSizes.padding),
              AppCardContainer(
                backgroundColor: AppColors.baseLv7,
                margin: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nilai Bisnis Anda',
                      style: AppTextStyle.bold(context, fontSize: 12),
                    ),
                    const SizedBox(height: AppSizes.padding / 4),
                    Text(
                      '${widget.rangeInvestment} lagi untuk mencapai target',
                      style: AppTextStyle.regular(context, fontSize: 12),
                    ),
                    const SizedBox(height: AppSizes.padding / 2),
                    AppProgress(
                      labelLeft: widget.countInvestment ?? '',
                      labelRight: '100%',
                      progressBackgroundColor: AppColors.baseLv6,
                      percent: widget.percentProgress ?? 0,
                      height: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.padding),
              widget.isDeleted == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: widget.onTapButton ??
                                () {
                                  // TODO
                                },
                            text: 'Lihat Detail',
                            fontSize: 12,
                            buttonColor: AppColors.primary.withOpacity(0.12),
                            textColor: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppSizes.padding / 2),
                        Text(
                          widget.countInvestor ?? '',
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
