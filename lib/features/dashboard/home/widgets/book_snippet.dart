import 'package:flutter/material.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/theme/theme.dart';

class SnippetCard extends StatefulWidget {
  final String snippet;
  const SnippetCard({super.key, required this.snippet});

  @override
  State<SnippetCard> createState() => _SnippetCardState();
}

class _SnippetCardState extends State<SnippetCard> {
  bool isMinimized = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: PADDING / 2, horizontal: PADDING / 2),
      decoration: BoxDecoration(
          color: AppTheme.light, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Snippet".toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    decoration:
                        TextDecoration.combine([TextDecoration.underline])),
              ),
              IconButton(
                onPressed: () {
                  isMinimized = !isMinimized;
                  setState(() {});
                },
                icon: Icon(
                  isMinimized
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_drop_up_rounded,
                  size: PADDING * 2,
                ),
              ),
            ],
          ),
          isMinimized ? Container() : const Divider(),
          isMinimized
              ? Container()
              : Text(
                  widget.snippet,
                  style: Theme.of(context).textTheme.bodySmall,
                )
        ],
      ),
    );
  }
}
