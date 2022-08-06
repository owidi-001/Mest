import 'package:flutter/material.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/theme/theme.dart';

class FoodCard extends StatefulWidget {
  List<Food> foods;
  FoodCard({Key? key, required this.foods}) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Food food = randomFood(foods);

  void _suggestFood() {
    setState(() {
      food = randomFood(widget.foods);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Container(
        // color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: () => {
                  // Navigator.pushReplacementNamed(
                  //     context, MyRoutes.profileRoute)
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.gradientColor,
                      // backgroundBlendMode: BlendMode.saturation,
                      image: DecorationImage(
                        image: AssetImage(
                          food.image,
                        ),
                      )),
                  // child: Image.asset(
                  //   food.image,
                  //   scale: 3.6,
                  // ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          food.name,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Somethig something lorem ipsum",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppTheme.darkColor),
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
                flex: 1,
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          shape: const StadiumBorder(),
                          backgroundColor: AppTheme.primaryColor,
                        ),
                        onPressed: _suggestFood,
                        child: const Text("Suggest")),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
