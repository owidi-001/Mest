import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  const ShimmerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppTheme.dark, highlightColor: AppTheme.green, child: child);
  }
}
