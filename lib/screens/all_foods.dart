import 'package:flutter/material.dart';
import 'package:mest/screens/food_detail.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/widgets/foodCard_horizontal.dart';

class AllFoods extends StatelessWidget {
  const AllFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
            return Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: FoodCardWidgetHorizontal(
                  food: foods[index],
                  onTapCallback: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetail(food: foods[index])))
                      }),
            );
          })))
        ],
      ),
    ));
  }
}
