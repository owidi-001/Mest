import 'package:flutter/material.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: PADDING * 1.2,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppTheme.red,
                radius: PADDING * 3,
                child: Padding(
                  padding: const EdgeInsets.all(PADDING / 4),
                  child: Image.asset(
                    "assets/images/avatar.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(
                width: PADDING,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "John Doe",
                    style: AppFont.title,
                  ),
                  SizedBox(
                    height: PADDING / 2,
                  ),
                  Text(
                    "Architect",
                    style: AppFont.normal,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: (() {
                          // To open up to profile edit
                        }),
                        child: const CircleAvatar(
                          backgroundColor: AppTheme.red,
                          child: Icon(
                            Icons.edit,
                            color: AppTheme.light,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
