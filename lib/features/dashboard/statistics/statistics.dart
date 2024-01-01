import 'package:flutter/material.dart';
import 'package:mest/features/dashboard/statistics/widgets/graph.dart';
import 'package:mest/shared/common/utils/utils.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Divider(),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: PADDING),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.timer),
                    SizedBox(
                      width: PADDING,
                    ),
                    Text("Time to target"),
                  ],
                ),
                Text("2.5hrs"),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Divider(),
        ),
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.only(top: PADDING),
            decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(PADDING),
                    topRight: Radius.circular(PADDING))),
            child: const Column(
              children: [
                Expanded(child: GraphView()),
                SizedBox(height: PADDING * 4)
              ],
            ),
          ),
        )
      ],
    );
  }
}
