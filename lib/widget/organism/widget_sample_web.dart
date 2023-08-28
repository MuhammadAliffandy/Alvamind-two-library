import 'package:alvamind_library_two/app/asset/app_assets.dart';
import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';

import 'package:alvamind_library_two/widget/organism/sidebar/sidebar.dart';
import 'package:alvamind_library_two/widget/organism/table_content/table_content.dart';
import 'package:alvamind_library_two/widget/organism/table_wrapper/table_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class WidgetTestSample extends StatefulWidget {
  static const routeName = '/widget-test-sample';

  const WidgetTestSample({
    super.key,
  });

  @override
  State<WidgetTestSample> createState() => _WidgetTestSampleState();
}

bool checkk = false;
List<bool> checkedList = [
  ...List.generate(15, (index) {
    return false;
  })
];

bool isDeleted = false;
ScrollController scrollController = ScrollController();
ScrollController barChartController = ScrollController();

class _WidgetTestSampleState extends State<WidgetTestSample> {
  PageController? pageController;
  TabController? tabController;
  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SideBar(
      onTapBar: (value) {},
      children: [
        Scaffold(
          backgroundColor: AppColors.baseLv7,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                tableContent()
              ],
            ),
          ),
        )
      ],
      pageController: pageController,
    );
  }

  Widget tableContent() {
    return TableWrapper(
      isChecked: true,
      checkedValue: checkk,
      onChangeChecked: (value) {
        // TODO
        checkk = !checkk;
        List.generate(15, (index) {
          return checkedList[index] = checkk;
        });
        setState(() {});
      },
      listTitle: const [
        'Nama',
        'Type',
        'File Size',
        'Tanggal Dibuat',
      ],
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            ...List.generate(15, (index) {
              return TableRow(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: AppColors.baseLv6,
                    width: index == 14 ? 0 : 1,
                  ),
                )),
                children: [
                  Flexible(
                    child: TableContent(
                      title: 'asdasdsdsadddasdasaasdaad',
                      isChecked: true,
                      image: index % 3 == 0
                          ? AppAssets.filePhotoIconPath
                          : index % 2 == 0
                              ? AppAssets.fileVideIconPath
                              : AppAssets.fileIconPath,
                      checkedValue: checkedList[index],
                      onChangeChecked: (value) {
                        // TODO
                        checkedList[index] = value;
                        setState(() {});
                      },
                    ),
                  ),
                  TableContent(
                    title: index % 3 == 0
                        ? 'Foto'
                        : index % 2 == 0
                            ? 'Video'
                            : 'File',
                    titleTextStyle: AppTextStyle.medium(
                      context,
                      fontSize: 16,
                      color: AppColors.baseLv5,
                    ),
                  ),
                  TableContent(
                    title: '64 Mb',
                    titleTextStyle: AppTextStyle.medium(
                      context,
                      fontSize: 16,
                      color: AppColors.baseLv5,
                    ),
                  ),
                  TableContent(
                    title: '13 Oktober 2023',
                    titleTextStyle: AppTextStyle.medium(
                      context,
                      fontSize: 16,
                      color: AppColors.baseLv5,
                    ),
                  ),
                ],
              );
            })
          ],
        )
      ],
    );
  }
}
