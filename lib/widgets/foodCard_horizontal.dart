import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/rating_bar.dart';

class FoodCardWidgetHorizontal extends StatelessWidget {
  final Food food;
  final VoidCallback onTapCallback;
  const FoodCardWidgetHorizontal(
      {Key? key, required this.food, required this.onTapCallback})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCallback(),
      child: Card(
          color: AppTheme.lightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.whiteColor,
                  ),
                  child: Image.asset(
                    food.image,
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: Text(
                            food.name,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppTheme.darkColor),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const RatingBox()
                      ],
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: AppTheme.whiteColor),
                        onPressed: () {
                          deleteFood(food);
                          const snackBar = SnackBar(
                            content: Text('Item permanently removed!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Icon(
                          CupertinoIcons.delete,
                          size: 18,
                          color: AppTheme.redColor,
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
