import 'package:flutter/material.dart';
import 'package:mest/screens/food_detail.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/constants.dart';
import 'package:mest/widgets/foodCard_horizontal.dart';

class AllFoods extends StatelessWidget {
  AllFoods({Key? key}) : super(key: key);
  List<Food> foods = allFoods();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
            backgroundColor: AppTheme.primaryColor,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text("Meal Suggester",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    "${baseUrl}app_img_1.png",
                    fit: BoxFit.cover,
                  )),
            ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(((
            context,
            index,
          ) {
            return Card(
              margin: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
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
          }), childCount: foods.length))
        ],
      ),
    ));
  }
}
