import 'package:alvamind_library_two/widget/molecule/app_checkbox.dart';
import 'package:alvamind_library_two/widget/organism/memberCard/member_card.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';

class TableWrapper extends StatefulWidget {
  final List<String> listTitle;
  final List<Widget> children;
  final bool? isCenter;
  final bool? isChecked;
  final bool? checkedValue;
  final void Function(bool)? onChangeChecked;

  const TableWrapper({
    super.key,
    required this.children,
    required this.listTitle,
    this.isCenter = false,
    this.isChecked = false,
    this.checkedValue,
    this.onChangeChecked,
  });

  @override
  State<TableWrapper> createState() => _TableWrapperState();
}

bool check = false;

class _TableWrapperState extends State<TableWrapper> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.baseLv6),
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
        ),
        child: Column(children: [
          Table(
            children: [
              TableRow(
                decoration: const BoxDecoration(color: AppColors.baseLv6),
                children: [
                  ...List.generate(widget.listTitle.length, (index) {
                    return TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: widget.isCenter == false
                          ? Padding(
                              padding: const EdgeInsets.all(AppSizes.padding / 2),
                              child: Row(
                                children: [
                                  widget.isChecked == true
                                      ? index == 0
                                          ? AppCheckbox(
                                              value: widget.checkedValue != null ? widget.checkedValue : check,
                                              activeColor: AppColors.baseLv5,
                                              onChanged: (value) {
                                                check = !check;
                                                setState(() {});
                                                widget.onChangeChecked!(check);
                                              },
                                            )
                                          : const SizedBox.shrink()
                                      : const SizedBox.shrink(),
                                  isChecked == true
                                      ? index == 0
                                          ? const SizedBox(width: AppSizes.padding / 2)
                                          : const SizedBox.shrink()
                                      : const SizedBox.shrink(),
                                  Text(
                                    widget.listTitle[index],
                                    style: AppTextStyle.medium(
                                      context,
                                      fontSize: 16,
                                      color: AppColors.baseLv5,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(AppSizes.padding / 2),
                                child: Text(
                                  widget.listTitle[index],
                                  style: AppTextStyle.medium(
                                    context,
                                    fontSize: 16,
                                    color: AppColors.baseLv5,
                                  ),
                                ),
                              ),
                            ),
                    );
                  })
                ],
              ),
            ],
          ),
          Column(
            children: widget.children,
          )
        ]),
      ),
    );
  }
}
