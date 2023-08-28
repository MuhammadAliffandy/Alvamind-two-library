import 'package:alvamind_library_two/app/asset/app_assets.dart';
import 'package:alvamind_library_two/app/asset/app_icons.dart';
import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';

import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:alvamind_library_two/widget/atom/app_button.dart';
import 'package:alvamind_library_two/widget/atom/my_icon_button.dart';

import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final PageController? pageController;
  final List<Widget>? children;
  final int? initialIndex;
  final void Function(int) onTapBar;

  const SideBar({
    Key? key,
    this.children,
    this.pageController,
    this.initialIndex,
    required this.onTapBar,
  }) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  PageController pageController = PageController();

  int itemPicked = 0;

  List<bool> isHover = [
    ...List.generate(
      10,
      (index) {
        return false;
      },
    )
  ];

  List<String> titleList = [
    'Dashboard',
    'Laporan',
    'Member',
    'Transaksi',
    'Program',
    'Hotel',
    'Project',
    'Marketing Kit',
    'Pengaturan',
    'Tentang Aplikasi',
  ];

  List<IconData> iconList = [
    CustomIcon.layer_icon,
    CustomIcon.document_icon,
    Icons.person_outline,
    CustomIcon.receipt_icon,
    CustomIcon.program_icon,
    CustomIcon.buliding_icon,
    Icons.feed_outlined,
    CustomIcon.note2_icon,
    CustomIcon.settings_icon,
    Icons.info_outline,
  ];

  bool isExpand = true;

  @override
  Widget build(BuildContext context) {
    double widthDrawer = isExpand == false ? 50 : 250;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 80),
          child: Drawer(
            width: widthDrawer,
            elevation: 0,
            backgroundColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: isExpand == false
                            ? const EdgeInsets.all(
                                AppSizes.padding / 1.5,
                              )
                            : EdgeInsets.all(AppSizes.padding),
                        child: AppIconButton(
                          icon: isExpand == false ? Icons.chevron_right : Icons.chevron_left,
                          iconSize: 20,
                          iconColor: AppColors.white,
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.all(2),
                          onPressed: () {
                            // TODO

                            setState(() {
                              isExpand = !isExpand;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding),
                    Padding(
                      padding: const EdgeInsets.only(left: AppSizes.padding / 1.5),
                      child: Container(
                        width: isExpand == false ? 25 : 40,
                        height: isExpand == false ? 25 : 40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              AppAssets.shortLogoPath,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding),
                  ],
                ),
                Expanded(
                    child: ListView(
                  children: [
                    ...List.generate(10, (item) {
                      return Column(
                        children: [
                          SideItem(
                            expand: isExpand,
                            title: titleList[item],
                            icon: iconList[item],
                            iconColor: widget.initialIndex != null
                                ? item == widget.initialIndex
                                    ? AppColors.primary
                                    : isHover[item] == true
                                        ? AppColors.primary
                                        : AppColors.baseLv4
                                : item == itemPicked
                                    ? AppColors.primary
                                    : isHover[item] == true
                                        ? AppColors.primary
                                        : AppColors.baseLv4,
                            titleStyle: widget.initialIndex != null
                                ? item == widget.initialIndex
                                    ? AppTextStyle.bold(
                                        context,
                                        fontSize: 14,
                                        color: AppColors.primary,
                                      )
                                    : isHover[item] == true
                                        ? AppTextStyle.bold(
                                            context,
                                            fontSize: 14,
                                            color: AppColors.primary,
                                          )
                                        : AppTextStyle.medium(
                                            context,
                                            fontSize: 14,
                                            color: AppColors.baseLv4,
                                          )
                                : item == itemPicked
                                    ? AppTextStyle.bold(
                                        context,
                                        fontSize: 14,
                                        color: AppColors.primary,
                                      )
                                    : isHover[item] == true
                                        ? AppTextStyle.bold(
                                            context,
                                            fontSize: 14,
                                            color: AppColors.primary,
                                          )
                                        : AppTextStyle.medium(
                                            context,
                                            fontSize: 14,
                                            color: AppColors.baseLv4,
                                          ),
                            onTap: () {
                              // TODO
                              itemPicked = item;
                              widget.onTapBar(itemPicked);
                              setState(() {});
                            },
                            onHover: (value) {
                              // TODO
                              isHover[item] = value;
                              setState(() {});
                            },
                          ),
                          item == 1
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
                                  child: Divider(
                                    thickness: 1,
                                    color: AppColors.baseLv6,
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      );
                    }),
                  ],
                )),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: footer(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: widget.pageController ?? pageController,
            children: widget.children ?? [],
          ),
        ),
      ],
    );
  }

  Widget footer() {
    return Padding(
      padding: isExpand == false ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          isExpand == false ? const SizedBox.shrink() : Image.network(AppAssets.longLogoPath),
          isExpand == false
              ? const SizedBox.shrink()
              : Text(
                  'v2 1.0 (12345)',
                  style: AppTextStyle.regular(context, fontSize: 13),
                ),
          isExpand == false
              ? const SizedBox.shrink()
              : const SizedBox(
                  height: AppSizes.padding * 1.5,
                ),
          isExpand == false
              ? AppIconButton(
                  icon: CustomIcon.logout_icon,
                  iconColor: Colors.white,
                  iconSize: 14,
                  padding: EdgeInsets.all(AppSizes.padding / 2),
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    // TODO
                  },
                )
              : AppButton(
                  leftIcon: CustomIcon.logout_icon,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.padding,
                    vertical: AppSizes.padding / 1.5,
                  ),
                  text: 'Logout',
                  onTap: () {
                    // TODO
                  },
                ),
          const SizedBox(height: AppSizes.padding * 1.5),
        ],
      ),
    );
  }
}

class SideItem extends StatefulWidget {
  const SideItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.onHover,
    this.iconColor,
    this.iconSize,
    this.titleStyle,
    this.expand = true,
  });
  final String title;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final TextStyle? titleStyle;
  final bool? expand;
  final void Function() onTap;
  final void Function(bool) onHover;
  @override
  State<SideItem> createState() => _SideItemState();
}

class _SideItemState extends State<SideItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      onHover: (value) {
        widget.onHover(value);
      },
      child: widget.expand == false
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 1.5),
              child: Icon(
                widget.icon,
                size: 20,
                color: widget.iconColor ?? AppColors.baseLv4,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.padding / 1.5, horizontal: AppSizes.padding),
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 20,
                    color: widget.iconColor ?? AppColors.baseLv4,
                  ),
                  SizedBox(width: AppSizes.padding),
                  Text(
                    widget.title,
                    style: widget.titleStyle ??
                        AppTextStyle.medium(
                          context,
                          fontSize: 14,
                          color: AppColors.baseLv4,
                        ),
                  ),
                ],
              ),
            ),
    );
  }
}
