import 'package:flutter/material.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    double percentage = 50;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: PADDING / 4),
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(PADDING)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PADDING / 2, vertical: PADDING),
            child: CircularPercentIndicator(
              radius: PADDING * 3,
              lineWidth: 8.0,
              animation: true,
              percent: 0.7,
              center: Text(
                "$percentage%",
                style: AppFont.whiteBody,
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.white,
              backgroundColor: Colors.white30,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: PADDING / 2),
                    child: Text(
                      food.name,
                      style: const TextStyle(
                          color: AppTheme.light,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: PADDING / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: PADDING / 2),
                    child: Text(
                      "Total picks: ${food.eats}",
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: PADDING,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
