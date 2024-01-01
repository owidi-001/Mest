import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';

class LibraryBookCardSkeleton extends ConsumerWidget {
  const LibraryBookCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: AppTheme.gray,
                borderRadius: BorderRadius.circular(PADDING / 2)),
            alignment: Alignment.center,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.gray,
                      borderRadius: BorderRadius.circular(PADDING / 2)),
                  margin: const EdgeInsets.symmetric(horizontal: PADDING / 2),
                  height: 10,
                  constraints: const BoxConstraints(maxWidth: 80),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppTheme.gray,
                            borderRadius: BorderRadius.circular(PADDING / 2)),
                        margin: const EdgeInsets.all(8.0),
                        height: 10,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.gray,
                      borderRadius: BorderRadius.circular(PADDING / 2)),
                  margin: const EdgeInsets.all(8.0),
                  height: 10,
                  constraints: const BoxConstraints(maxWidth: 100),
                ),
              ],
            ),
          ),
          const IconButton(onPressed: null, icon: Icon(Icons.chevron_right))
        ],
      ),
    );
  }
}
