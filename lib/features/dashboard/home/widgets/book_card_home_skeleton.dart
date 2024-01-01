import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';

class BookCardSkeleton extends StatelessWidget {
  const BookCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.all(
          Radius.circular(PADDING / 4),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 100,
                margin: const EdgeInsets.all(PADDING / 4),
                decoration: BoxDecoration(
                    color: AppTheme.gray,
                    borderRadius: BorderRadius.circular(PADDING / 2)),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 15,
                            width: double.infinity,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.bookmark,
                            // size: 32,
                            color: AppTheme.gray,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.gray,
                                borderRadius:
                                    BorderRadius.circular(PADDING / 2)),
                            margin: const EdgeInsets.all(8.0),
                            height: 8,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.gray,
                        borderRadius: BorderRadius.circular(PADDING / 2)),
                    height: 10,
                    constraints: const BoxConstraints(maxWidth: 100),
                    margin: const EdgeInsets.all(PADDING / 4),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.gray,
                        borderRadius: BorderRadius.circular(PADDING / 2)),
                    height: 8,
                    constraints: const BoxConstraints(maxWidth: 80),
                    margin: const EdgeInsets.symmetric(horizontal: PADDING / 4),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.chat_bubble_fill,
                      color: AppTheme.gray,
                    ),
                    label: Container(
                      decoration: BoxDecoration(
                          color: AppTheme.gray,
                          borderRadius: BorderRadius.circular(PADDING / 2)),
                      height: 5,
                      width: 20,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart_fill,
                      color: AppTheme.gray,
                    ),
                    label: Container(
                      decoration: BoxDecoration(
                          color: AppTheme.gray,
                          borderRadius: BorderRadius.circular(PADDING / 2)),
                      height: 5,
                      width: 20,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
