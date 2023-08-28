import 'package:alvamind_library_two/widget/atom/app_card_container.dart';
import 'package:alvamind_library_two/widget/molecule/app_checkbox.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atom/my_icon_button.dart';

class MemberCard extends StatefulWidget {
  final String? nameText;
  final String? idText;
  final String? jobText;
  final String? currentDateText;
  final String? countPoin;
  final String? countCommission;
  final String? countMember;
  final String? image;
  final String? statusMemberText;
  final Widget? statusMemberIcon;
  final bool? isDeleted;
  final bool? isDetail;
  final bool? withExpandButton;
  final List<Widget>? children;
  final void Function(bool)? onChanged;

  const MemberCard({
    super.key,
    this.currentDateText,
    this.idText,
    this.image,
    this.jobText,
    this.nameText,
    this.children,
    this.isDeleted = false,
    this.withExpandButton = true,
    this.isDetail = false,
    this.onChanged,
    this.countCommission,
    this.countMember,
    this.countPoin,
    this.statusMemberIcon,
    this.statusMemberText,
  });

  @override
  State<MemberCard> createState() => _MemberCardState();
}

bool isExpand = false;
bool isChecked = false;

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (index, isExpanded) {
        isExpand = !isExpand;
        setState(() {});
      },
      expandedHeaderPadding: EdgeInsets.zero,
      expandIconColor: AppColors.white,
      animationDuration: const Duration(milliseconds: 600),
      children: [
        ExpansionPanel(
          hasIcon: false,
          canTapOnHeader: true,
          backgroundColor: Colors.white,
          headerBuilder: (_, isExpanded) => Container(
            padding: widget.isDetail == true ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: widget.isDetail == true
                  ? Border()
                  : const Border(
                      top: BorderSide(color: AppColors.baseLv6, width: 1),
                      bottom: BorderSide(color: AppColors.baseLv6, width: 1),
                    ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    widget.withExpandButton == false
                        ? const SizedBox.shrink()
                        : widget.isDeleted == false
                            ? Container(
                                padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
                                child: AppIconButton(
                                  icon: widget.children == null
                                      ? Icons.circle
                                      : isExpand == false
                                          ? Icons.circle
                                          : Icons.keyboard_arrow_down,
                                  iconColor: AppColors.white,
                                  backgroundColor: AppColors.primary,
                                  iconSize: 16,
                                  padding: const EdgeInsets.all(AppSizes.padding / 4),
                                  onPressed: () {
                                    // TODO
                                    isExpand = !isExpand;
                                    setState(() {});
                                  },
                                ),
                              )
                            : AppCheckbox(
                                value: isChecked,
                                activeColor: AppColors.primary,
                                onChanged: (value) {
                                  isChecked = value!;
                                  setState(() {});
                                  widget.onChanged!(isChecked);
                                  // TODO
                                },
                              ),
                    widget.withExpandButton == false ? const SizedBox.shrink() : const SizedBox(width: AppSizes.padding / 2),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      backgroundImage: NetworkImage(
                        widget.image ?? ' ',
                      ),
                      maxRadius: widget.isDetail == true ? 25 : null,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.nameText ?? '',
                              style: AppTextStyle.bold(
                                context,
                                fontSize: widget.isDetail == true ? 20 : 16,
                              ),
                            ),
                            const SizedBox(width: AppSizes.padding / 2),
                            widget.isDetail == true
                                ? Row(
                                    children: [
                                      widget.statusMemberIcon ??
                                          Icon(
                                            Icons.check_circle,
                                            size: widget.isDetail == true ? 16 : 12,
                                            color: Color(0xFF36D362),
                                          ),
                                      const SizedBox(width: AppSizes.padding / 2),
                                      Text(
                                        widget.statusMemberText ?? '',
                                        style: AppTextStyle.regular(
                                          context,
                                          fontSize: widget.isDetail == true ? 14 : 12,
                                          color: Color(0xFF36D362),
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    widget.idText ?? '',
                                    style: AppTextStyle.regular(
                                      context,
                                      fontSize: 12,
                                      color: AppColors.baseLv4,
                                    ),
                                  ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.height / 2),
                        Text(
                          '${widget.jobText}  ·  ${widget.currentDateText}',
                          style: AppTextStyle.medium(
                            context,
                            fontSize: widget.isDetail == true ? 16 : 13,
                            color: AppColors.baseLv4,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                widget.withExpandButton == false
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          ...List.generate(3, (index) {
                            return AppCardContainer(
                              borderRadius: BorderRadius.circular(100),
                              margin: const EdgeInsets.symmetric(
                                vertical: AppSizes.padding * 1.5,
                                horizontal: AppSizes.padding / 4,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.padding * 2,
                                vertical: AppSizes.padding / 2,
                              ),
                              backgroundColor: AppColors.baseLv6,
                              child: Text(
                                index == 0
                                    ? widget.countPoin ?? 'Poin 542'
                                    : index == 1
                                        ? widget.countCommission ?? 'Komisi Rp 235.986.223'
                                        : widget.countMember ?? '23 Member',
                                style: AppTextStyle.medium(
                                  context,
                                  fontSize: 10,
                                ),
                              ),
                            );
                          })
                        ],
                      )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: AppSizes.padding * 2.3),
            child: Column(
              children: widget.children ?? [],
            ),
          ),
          isExpanded: isExpand,
        ),
      ],
    );
  }
}
