import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:alvamind_library_two/model/chart_data.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppDoughnutBarChart extends StatelessWidget {
  final double activeValue;
  final double nonActiveValue;
  final String? centerTitle;
  final String? centersubtitle;

  const AppDoughnutBarChart({
    super.key,
    required this.activeValue,
    required this.nonActiveValue,
    this.centerTitle,
    this.centersubtitle,
  });

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(
        'Aktif',
        activeValue,
        AppColors.primary,
      ),
      ChartData(
        'Tidak Aktif',
        nonActiveValue,
        Color(0xFFEAF0FF),
      ),
    ];
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            verticalAlignment: ChartAlignment.far,
            widget: Text(
              centerTitle ?? '',
              style: AppTextStyle.bold(
                context,
                color: AppColors.baseLv5,
                fontSize: 18,
              ),
            )),
        CircularChartAnnotation(
            verticalAlignment: ChartAlignment.near,
            widget: Text(
              centersubtitle ?? '',
              style: AppTextStyle.bold(
                context,
                color: AppColors.base,
                fontSize: 41,
              ),
            )),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (ChartData data, _) => data.color,
          startAngle: 270,
          endAngle: 90,
        )
      ],
    );
  }
}
