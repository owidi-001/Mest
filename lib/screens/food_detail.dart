import 'package:flutter/material.dart';
import 'package:mest/main.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/theme.dart';

class FoodDetail extends StatelessWidget {
  Food food;
  FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 28, left: 16, right: 16, bottom: 8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            backgroundColor: AppTheme.whiteColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: AppTheme.darkColor,
                        )),
                    const Text(
                      "Detail",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkColor),
                    ),
                    const Text("")
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppTheme.secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Image.asset(food.image),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  food.name,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkColor),
                ),
                Text(
                  "${food.category.name} Meal",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: AppTheme.secondaryColor),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: AppTheme.darkColor),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                    "Dolorem est autem reiciendis aspernatur laborum animi est. Corrupti in consequatur commodi optio nulla perferendis laborum. Explicabo voluptatum sit ex eveniet nesciunt et. Unde labore ut non at cumque quasi.Aperiam aut dolor dolores. Sed ad omnis corrupti distinctio eius. Modi incidunt aspernatur fugiat qui."),
                const SizedBox(
                  height: 24,
                ),
                Flex(
                  direction: Axis.horizontal,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${food.approximateCost}",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor),
                          ),
                          const Text(
                            "/meal",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              shape: const StadiumBorder(),
                              backgroundColor: AppTheme.primaryColor,
                            ),
                            onPressed: () {},
                            child: const Text("Eat This")),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
