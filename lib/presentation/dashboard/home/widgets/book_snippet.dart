import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

class SnippetCard extends StatefulWidget {
  final String snippet;
  const SnippetCard({super.key, required this.snippet});

  @override
  State<SnippetCard> createState() => _SnippetCardState();
}

class _SnippetCardState extends State<SnippetCard> {
  bool isMinimized = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
      decoration: BoxDecoration(
          color: AppTheme.light, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Read Snippet",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  isMinimized = !isMinimized;
                  setState(() {});
                },
                icon: Icon(isMinimized
                    ? CupertinoIcons.chevron_down
                    : CupertinoIcons.chevron_up),
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
