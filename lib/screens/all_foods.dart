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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
              child: Container(
                color: AppTheme.primaryColor,
              ),
            ),
          ),
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
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 10, left: 16),
            child: const Text(
              "All Saved Foods",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor),
            ),
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(((
            context,
            index,
          ) {
            return Card(
              margin: const EdgeInsets.only(
                  top: 8.0, left: 16, right: 16, bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: AppTheme.lightColor,
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
    );
  }
}
