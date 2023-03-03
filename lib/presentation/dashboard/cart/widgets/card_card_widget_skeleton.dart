import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';

class CartItemWidgetSkeleton extends ConsumerWidget {
  const CartItemWidgetSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: AppTheme.gray,
                    borderRadius: BorderRadius.circular(PADDING / 2)),
                alignment: Alignment.center,
                // child: Container(
                //   decoration: BoxDecoration(
                //       color: AppTheme.dark,
                //       borderRadius: BorderRadius.circular(12)),
                // ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.gray,
                      borderRadius: BorderRadius.circular(PADDING / 2)),
                  margin: const EdgeInsets.all(8.0),
                  height: 15,
                  width: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.gray,
                      borderRadius: BorderRadius.circular(PADDING / 2)),
                  margin: const EdgeInsets.all(8.0),
                  height: 10,
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
