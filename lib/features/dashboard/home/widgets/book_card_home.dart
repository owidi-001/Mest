import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mest/features/dashboard/home/book_preview.dart';
import 'package:mest/features/dashboard/home/models/book_model.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';

class BookCard extends StatefulWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Open detail view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ontext) => DetailScreen(product: widget.book),
          ),
        );
      },
      onDoubleTap: () {
        liked = !liked;
        setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.all(Radius.circular(PADDING / 4))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 120,
                  margin: const EdgeInsets.all(PADDING / 4),
                  decoration: BoxDecoration(
                      color: widget.book.coverImage != null
                          ? Colors.transparent
                          : AppTheme.dark,
                      image: DecorationImage(
                          image: AssetImage(widget.book.coverImage!),
                          fit: BoxFit.contain,
                          alignment: Alignment.center),
                      borderRadius: BorderRadius.circular(PADDING / 2)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Cruiding Destination Ideas",
                                textWidthBasis: TextWidthBasis.parent,
                                style: AppFont.title.copyWith(
                                    fontSize: 18, overflow: TextOverflow.clip),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  saved = !saved;
                                });
                              },
                              child: FaIcon(
                                saved
                                    ? FontAwesomeIcons.solidBookmark
                                    : FontAwesomeIcons.bookmark,
                                color: saved ? AppTheme.dark : AppTheme.gray,
                                size: PADDING + 4,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Here is the quick brown fox little story balsh blah",
                          maxLines: 2,
                          style: AppFont.subtitle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis),
                        ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: AppFont.title.copyWith(fontSize: 14),
                      ),
                      Text(
                        "5 min read",
                        style: AppFont.normal.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.comment,
                        color: AppTheme.gray,
                      ),
                      label: Text(
                        "255",
                        style: AppFont.normal.copyWith(fontSize: 12),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          liked = !liked;
                        });
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.heart,
                        color: liked ? AppTheme.red : AppTheme.gray,
                      ),
                      label: Text(
                        "255",
                        style: AppFont.normal.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
