import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/shared/data/models/book/user_book.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

class LibraryBookCard extends ConsumerWidget {
  final UserBook userBook;
  const LibraryBookCard({Key? key, required this.userBook}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              alignment: Alignment.center,
              child: userBook.book.coverImage.toString().isNotEmpty
                  ?
                  // Image.memory(
                  //     const Base64Decoder().convert(userBook.book.product.image),
                  //     fit: BoxFit.fill,
                  //   )
                  Image.asset(
                      "${userBook.book.coverImage}",
                      fit: BoxFit.fill,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: AppTheme.dark,
                          borderRadius: BorderRadius.circular(12)),
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${userBook.book.genre}',
                      style: AppFont.subtitle.copyWith(
                          fontSize: 14,
                          color: AppTheme.gray,
                          fontWeight: FontWeight.normal)),
                  Text(userBook.book.title!,
                      style: AppFont.title.copyWith(fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('${userBook.book.author}',
                      style: AppFont.subtitle.copyWith(
                          fontSize: 14,
                          color: AppTheme.gray,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right))
          ],
        ),
      ),
    );
  }
}
