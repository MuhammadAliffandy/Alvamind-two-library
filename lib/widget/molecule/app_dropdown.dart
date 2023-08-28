import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../organism/profile_user/profile_user.dart';

class AppDropDown extends StatefulWidget {
  final Widget? customButton;
  final ButtonStyleData? buttonStyleData;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData? menuItemStyleData;
  final EdgeInsets? padding;

  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object)? onChanged;

  const AppDropDown({
    super.key,
    this.customButton,
    this.buttonStyleData,
    this.dropdownStyleData,
    this.menuItemStyleData,
    this.items,
    this.onChanged,
    this.padding,
  });

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: widget.customButton ??
            SizedBox(
              width: 150,
              height: 70,
              child: ProfileUser(
                title: 'OtakuBoy',
                subtitle: 'SuperUser',
                titleTextStyle: AppTextStyle.bold(context, fontSize: 14),
                subtitleTextStyle: AppTextStyle.regular(context, fontSize: 12),
                backgroundColor: AppColors.white,
                onTap: (value) {
                  // TODO
                },
              ),
            ),
        buttonStyleData: widget.buttonStyleData ??
            ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
        items: widget.items ??
            [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
            ],
        onChanged: (value) {
          // TODO
          widget.onChanged!(value!);
        },
        dropdownStyleData: widget.dropdownStyleData ??
            DropdownStyleData(
              width: 200,
              padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                color: Colors.white,
              ),
              offset: const Offset(-50, -10),
            ),
        menuItemStyleData: widget.menuItemStyleData ??
            MenuItemStyleData(
              customHeights: [
                ...List<double>.filled(MenuItems.firstItems.length, 48),
              ],
              padding: const EdgeInsets.only(left: 16, right: 16),
            ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;
  final IconData? icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [
    home,
    settings,
    logout
  ];

  static const home = MenuItem(
    text: 'Home',
  );

  static const settings = MenuItem(
    text: 'Settings',
  );
  static const logout = MenuItem(
    text: 'Log Out',
  );

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        item.icon == null ? const SizedBox.shrink() : Icon(item.icon, color: Colors.black, size: 22),
        const SizedBox(
          width: AppSizes.padding / 2,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
