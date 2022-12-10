import 'package:flutter/material.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/theme.dart';

class MenuCard extends StatelessWidget {
  Food food;
  MenuCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.gradient,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(food.image),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              food.name,
              style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: AppTheme.primary,
                child: Icon(
                  Icons.edit,
                  color: AppTheme.whiteColor,
                ),
              ))
        ],
      ),
    );
  }
}
