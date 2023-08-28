import 'package:alvamind_library_two/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/theme/app_colors.dart';

class AppStackedBarChart extends StatefulWidget {
  final List<String> listLabel;
  final List<double> listValue;
  final NumericAxis? numericAxis;
  final CategoryAxis? categoryAxis;

  AppStackedBarChart({
    Key? key,
    required this.listLabel,
    required this.listValue,
    this.numericAxis,
    this.categoryAxis,
  }) : super(key: key);

  @override
  AppStackedBarChartState createState() => AppStackedBarChartState();
}

class AppStackedBarChartState extends State<AppStackedBarChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      ...List.generate(widget.listLabel.length, (index) {
        return _ChartData(widget.listLabel[index], widget.listValue[index]);
      }),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: widget.categoryAxis ??
          CategoryAxis(
            labelStyle: AppTextStyle.medium(
              context,
              fontSize: 13,
              color: AppColors.baseLv4,
            ),
          ),
      primaryYAxis: widget.numericAxis ?? NumericAxis(minimum: 0, maximum: 50, interval: 10),
      tooltipBehavior: _tooltip,
      series: <ChartSeries<_ChartData, String>>[
        BarSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          color: AppColors.primary,
          width: 0.4,
          borderRadius: BorderRadius.circular(50),
        )
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
