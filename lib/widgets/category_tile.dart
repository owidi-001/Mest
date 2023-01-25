import 'package:flutter/material.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

class CategoryTile extends StatelessWidget {
  final Color? color;
  final FoodCategory group;

  const CategoryTile({super.key, required this.group, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color ?? AppTheme.gold,
        foregroundColor: AppTheme.light,
        child: group.icon,
      ),
      title: Text(
        group.name,
        style: AppFont.subtitle,
      ),
      subtitle: Text("${categoryTotal(group.name)} Foods available."),
    );
  }
}

// TODO! insert in provider
int categoryTotal(String name) {
  return 0;
}
