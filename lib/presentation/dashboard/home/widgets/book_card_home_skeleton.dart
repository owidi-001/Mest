import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';

class BookCardSkeleton extends StatelessWidget {
  const BookCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: PADDING / 2, horizontal: PADDING / 2),
      decoration: const BoxDecoration(color: Colors.white54),
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            right: PADDING,
            child: Icon(
              Icons.bookmark,
              size: 32,
              color: AppTheme.gray,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    margin: const EdgeInsets.all(PADDING / 4),
                    decoration: BoxDecoration(
                        color: AppTheme.gray,
                        borderRadius: BorderRadius.circular(PADDING / 2)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.gray,
                              borderRadius: BorderRadius.circular(PADDING / 2)),
                          margin: const EdgeInsets.all(8.0),
                          height: 15,
                          width: 200,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.gray,
                                  borderRadius:
                                      BorderRadius.circular(PADDING / 2)),
                              margin: const EdgeInsets.all(8.0),
                              height: 15,
                              width: 100,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppTheme.gray,
                                  borderRadius:
                                      BorderRadius.circular(PADDING / 2)),
                              margin: const EdgeInsets.all(8.0),
                              height: 10,
                              width: 50,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.gray,
                              borderRadius: BorderRadius.circular(PADDING / 2)),
                          margin: const EdgeInsets.all(8.0),
                          height: 8,
                          width: 200,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.gray,
                              borderRadius: BorderRadius.circular(PADDING / 2)),
                          margin: const EdgeInsets.all(8.0),
                          height: 8,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.gray,
                              borderRadius: BorderRadius.circular(PADDING / 2)),
                          margin: const EdgeInsets.all(8.0),
                          height: 8,
                          width: 100,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppTheme.gray,
                              borderRadius: BorderRadius.circular(PADDING / 2)),
                          margin: const EdgeInsets.all(8.0),
                          height: 8,
                          width: 150,
                        ),
                      ],
                    ),
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
                          margin: const EdgeInsets.all(8.0),
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
                          margin: const EdgeInsets.all(8.0),
                          height: 5,
                          width: 20,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}


// SizedBox(
//   width: 200.0,
//   height: 100.0,
//   child: Shimmer.fromColors(
//     baseColor: Colors.red,
//     highlightColor: Colors.yellow,
//     child: Text(
//       'Shimmer',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 40.0,
//         fontWeight:
//         FontWeight.bold,
//       ),
//     ),
//   ),
// );