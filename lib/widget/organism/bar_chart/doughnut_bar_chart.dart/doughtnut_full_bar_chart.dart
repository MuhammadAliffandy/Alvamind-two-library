import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:alvamind_library_two/model/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppFullDoughnutBarChart extends StatelessWidget {
  final List<ChartData> chartData;
  final bool? isVisible;
  final String? centerTitle;
  final String? centersubtitle;

  const AppFullDoughnutBarChart({
    super.key,
    this.isVisible,
    this.centerTitle,
    this.centersubtitle,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            verticalAlignment: ChartAlignment.far,
            widget: Text(
              centerTitle ?? 'Total Member',
              style: AppTextStyle.bold(
                context,
                color: AppColors.baseLv5,
                fontSize: 13,
              ),
            )),
        CircularChartAnnotation(
            verticalAlignment: ChartAlignment.near,
            widget: Text(
              centersubtitle ?? '12.124',
              style: AppTextStyle.bold(
                context,
                color: AppColors.base,
                fontSize: 20,
              ),
            )),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (ChartData data, _) => data.color,
            startAngle: 0,
            endAngle: 360,
            dataLabelMapper: (ChartData data, _) => data.y.toString() + '%',
            dataLabelSettings: DataLabelSettings(
              isVisible: isVisible ?? false,
              textStyle: AppTextStyle.medium(
                context,
                fontSize: 10,
                color: Color.fromARGB(255, 255, 246, 246),
              ),
            ))
      ],
    );
  }
}
