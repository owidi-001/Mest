import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final Function() onTapCallBack;
  final bool selected;

  const CategoryButton(
      {super.key,
      required this.text,
      required this.onTapCallBack,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: PADDING / 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: selected ? AppTheme.gray : Colors.transparent,
          border: Border.all(width: 1, color: Colors.black26),
          borderRadius: BorderRadius.circular(PADDING / 4)),
      child: InkWell(
        onTap: onTapCallBack,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PADDING),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : AppTheme.dark,
            ),
          ),
        ),
      ),
    );
  }
}
