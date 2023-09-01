import 'package:flutter/material.dart';
import 'package:mest/features/dashboard/home/models/book_model.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/theme/theme.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: 150,
            width: 120,
            margin: const EdgeInsets.all(PADDING / 4),
            decoration: BoxDecoration(
              color: AppTheme.dark,
              image: DecorationImage(image: AssetImage(book.coverImage!)),
              borderRadius: BorderRadius.circular(PADDING / 2),
            ),
          ),
        ),
        const SizedBox(
          height: PADDING / 2,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Text(
            book.title ?? "XYZ",
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: PADDING / 2,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Text(
            "By ${book.author}",
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
