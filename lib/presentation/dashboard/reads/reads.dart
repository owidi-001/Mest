import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';
import 'package:mest/common/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Reads extends StatefulWidget {
  const Reads({super.key});

  @override
  State<Reads> createState() => _ReadsState();
}

class _ReadsState extends State<Reads> {
  final DatePickerController _controller = DatePickerController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    final List<ChartData> chartData = [
      ChartData('The quick brown fox', 20, AppTheme.gold),
      ChartData('The titanic', 80, AppTheme.green),
      ChartData('Jack hallow', 90, AppTheme.red),
      ChartData('Others', 52, AppTheme.blue)
    ];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.blueGrey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 100,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // const SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: PADDING,
        //   ),
        // ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     childCount: recipes.length,
        //     (context, index) => Padding(
        //       padding: const EdgeInsets.symmetric(
        //           horizontal: PADDING, vertical: PADDING / 2),
        //       child: RecipeCard(recipe: recipes[index]),
        //     ),
        //   ),
        // ),

        SliverToBoxAdapter(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: PADDING),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                // borderRadius: BorderRadius.circular(PADDING),
              ),
              child: SfCircularChart(
                  title: ChartTitle(
                    text: "Your read time today",
                    alignment: ChartAlignment.near,
                    textStyle: AppFont.title.copyWith(fontSize: 18),
                  ),
                  legend: Legend(isVisible: true),
                  series: <CircularSeries>[
                    // Renders radial bar chart
                    RadialBarSeries<ChartData, String>(
                      maximumValue: 100,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
