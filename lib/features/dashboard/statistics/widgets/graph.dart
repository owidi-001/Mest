import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mest/theme/font.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class GraphView extends StatefulWidget {
  const GraphView({super.key});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  _GraphViewState();
  List<_ChartData> _chartData = [];
  late TooltipBehavior _tooltipBehavior;

  Timer? _timer;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getChartData();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _getChartData();
      });
    });
    return _buildAnimationSplineChart();
  }

  /// get the spline chart sample with dynamically updated data points.
  SfCartesianChart _buildAnimationSplineChart() {
    return SfCartesianChart(
        // Enables the tooltip for all the series in chart
        tooltipBehavior: _tooltipBehavior,
        title: ChartTitle(text: 'Read time', textStyle: AppFont.subtitle),
        // legend: Legend(isVisible: true),
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(
            title: AxisTitle(text: "Days"),
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            title: AxisTitle(text: "Time in HRS"),
            majorTickLines: const MajorTickLines(color: Colors.transparent),
            axisLine: const AxisLine(width: 0),
            minimum: 0,
            maximum: 100),
        series: _getDefaultSplineSeries());
  }

  /// get the spline series sample with dynamically updated data points.
  List<SplineSeries<_ChartData, num>> _getDefaultSplineSeries() {
    return <SplineSeries<_ChartData, num>>[
      SplineSeries<_ChartData, num>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  void dispose() {
    _timer?.cancel();
    _chartData.clear();
    super.dispose();
  }

  /// get the random value
  int _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  //Get the random data points
  void _getChartData() {
    _chartData = <_ChartData>[];
    for (int i = 0; i < 11; i++) {
      _chartData.add(_ChartData(i, _getRandomInt(15, 85)));
    }
    _timer?.cancel();
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final int x;
  final int y;
}
