import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/home/book_preview.dart';
import 'package:mest/presentation/dashboard/home/models/book_model.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';
import 'package:mest/common/utils/utils.dart';

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
        margin: const EdgeInsets.symmetric(vertical: PADDING / 2),
        decoration: const BoxDecoration(color: Colors.white54),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: PADDING,
              child: InkWell(
                onTap: () {
                  setState(() {
                    saved = !saved;
                  });
                },
                child: Icon(
                  saved ? Icons.bookmark : Icons.bookmark_border_rounded,
                  size: 32,
                  color: saved ? AppTheme.dark : AppTheme.gray,
                ),
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
                          color: widget.book.coverImage != null
                              ? Colors.transparent
                              : AppTheme.dark,
                          image: DecorationImage(
                              image: AssetImage(widget.book.coverImage!)),
                          borderRadius: BorderRadius.circular(PADDING / 2)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Cruiding Destination Ideas",
                              textWidthBasis: TextWidthBasis.parent,
                              style: AppFont.title.copyWith(
                                  fontSize: 18, overflow: TextOverflow.clip),
                            ),
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
                          icon: const Icon(
                            CupertinoIcons.chat_bubble_fill,
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
                          icon: Icon(
                            CupertinoIcons.heart_fill,
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
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mest/presentation/dashboard/home/models/book_model.dart';
// import 'package:mest/theme/font.dart';
// import 'package:mest/theme/theme.dart';
// import 'package:mest/utils/utils.dart';

// class BookCard extends StatelessWidget {
//   final Book book;
//   const BookCard({super.key, required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       child: Stack(children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: PADDING / 2),
//               decoration: BoxDecoration(
//                   color: AppTheme.dark,
//                   borderRadius: BorderRadius.circular(PADDING / 2)),
//               child: Image.asset(book.coverImage!),
//             ),
//           ],
//         ),
//         Positioned(
//             top: 10,
//             bottom: 10,
//             left: 0,
//             child: Container(
//               width: MediaQuery.of(context).size.width / 2,
//               padding: const EdgeInsets.all(PADDING / 2),
//               margin: const EdgeInsets.symmetric(vertical: PADDING * 2),
//               decoration: BoxDecoration(
//                   color: Colors.blueGrey,
//                   borderRadius: BorderRadius.circular(PADDING / 2)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${book.title}",
//                         maxLines: 1,
//                         style: AppFont.title.copyWith(
//                             fontSize: 24,
//                             color: AppTheme.light,
//                             overflow: TextOverflow.clip),
//                       ),
//                       Text(
//                         "${book.author}",
//                         style: AppFont.normal.copyWith(color: Colors.white54),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.chrome_reader_mode_rounded,
//                         color: Colors.blue[200],
//                       ),
//                       const SizedBox(
//                         width: PADDING,
//                       ),
//                       RichText(
//                           text: const TextSpan(
//                               text: "300",
//                               children: [TextSpan(text: "Reads")])),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.thumb_up_alt_rounded,
//                         color: Colors.blue[200],
//                       ),
//                       const SizedBox(
//                         width: PADDING,
//                       ),
//                       RichText(
//                           text: const TextSpan(
//                               text: "300 ",
//                               children: [TextSpan(text: "Likes")])),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.thumb_down_rounded,
//                         color: Colors.blue[200],
//                       ),
//                       const SizedBox(
//                         width: PADDING,
//                       ),
//                       RichText(
//                           text: const TextSpan(
//                               text: "300 ",
//                               children: [TextSpan(text: "Reads")])),
//                     ],
//                   ),
//                   InkWell(
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text("Chill bro, coming soon!"),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Read now",
//                           style: AppFont.normal.copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: AppTheme.gray),
//                         ),
//                         Icon(
//                           Icons.chevron_right_rounded,
//                           color: Colors.blue[200],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ))
//       ]),
//     );
//   }
// }
