import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:alvamind_library_two/widget/atom/app_button.dart';
import 'package:alvamind_library_two/widget/atom/app_image.dart';
import 'package:alvamind_library_two/widget/molecule/app_caraousel_slider.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatefulWidget {
  final String? locationText;
  final String? quotaText;
  final String title;
  final String? subtitle;
  final List<String>? image;
  final double? countStar;
  final double? titleSize;
  final double? subtitleSize;
  final bool? isDeleted;
  final double? imgHeight;
  final void Function()? onTapButton;

  const HotelCard({
    super.key,
    required this.title,
    this.subtitle,
    this.isDeleted = false,
    this.onTapButton,
    this.countStar = 5,
    this.image,
    this.locationText,
    this.quotaText,
    this.titleSize,
    this.subtitleSize,
    this.imgHeight,
  });

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(4, 4),
              blurRadius: 22,
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.locationText ?? '',
                          style: AppTextStyle.regular(context, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kuota',
                          style: AppTextStyle.regular(context, fontSize: 12),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.quotaText ?? '',
                          style: AppTextStyle.bold(context, fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: AppSizes.padding),
                AppCarouselSlider(
                  height: widget.imgHeight ?? 220,
                  contentList: [
                    ...List.generate(3, (i) {
                      return SizedBox(
                        height: widget.imgHeight ?? 220,
                        width: constraints.maxWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                          child: AppImage(
                            fit: BoxFit.cover,
                            image: widget.image != null ? widget.image![i] : 'https://picsum.photos/id/1${i}7/200/300',
                          ),
                        ),
                      );
                    })
                  ],
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
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < widget.countStar! ? Colors.amber : AppColors.baseLv7,
                        size: 18,
                      );
                    })
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
                AppButton(
                  onTap: widget.onTapButton ??
                      () {
                        // TODO

                        setState(() {});
                      },
                  textColor: widget.isDeleted == false ? AppColors.primary : AppColors.red,
                  text: widget.isDeleted == false ? 'Lihat Detail' : 'Hapus',
                  buttonColor: widget.isDeleted == false ? AppColors.primary.withOpacity(0.12) : AppColors.red.withOpacity(0.12),
                ),
              ],
            );
          },
        ));
  }
}
