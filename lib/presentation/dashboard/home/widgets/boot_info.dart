import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/home/models/book_model.dart';
import 'package:mest/presentation/dashboard/home/widgets/book_snippet.dart';
import 'package:mest/presentation/dashboard/widgets/drawer.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';
import 'package:mest/common/utils/utils.dart';
import 'package:mest/common/widgets/app_button.dart';

class SnippetViewContent extends StatelessWidget {
  final Book product;
  const SnippetViewContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
        top: size.height * 0.05,
        left: PADDING,
        right: PADDING,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(product.title!,
                    style: AppFont.title.copyWith(fontSize: 24)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 1,
                width: 40,
                decoration: BoxDecoration(
                    color: AppTheme.dark,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),

          Container(
            padding: const EdgeInsets.all(PADDING),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadiusDirectional.circular(PADDING / 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1, // you can play with this value, by default it is 1
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppTheme.gold,
                      ),
                      Text.rich(TextSpan(
                          text: " 4.5",
                          style: AppFont.normal.copyWith(color: AppTheme.light),
                          children: [
                            TextSpan(
                                text: "/5",
                                style: AppFont.normal.copyWith(
                                    color: Colors.white54, fontSize: 12))
                          ]))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu_book_outlined,
                        color: AppTheme.light,
                      ),
                      Text.rich(TextSpan(
                          text: " ",
                          style: AppFont.normal.copyWith(color: AppTheme.light),
                          children: [
                            TextSpan(
                                text: "reads",
                                style: AppFont.normal
                                    .copyWith(color: Colors.white54))
                          ]))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.last_page_sharp,
                        color: AppTheme.light,
                      ),
                      Text.rich(TextSpan(
                          text: " ",
                          style: AppFont.normal.copyWith(color: AppTheme.dark),
                          children: [
                            TextSpan(
                                text: "pages",
                                style: AppFont.normal
                                    .copyWith(color: Colors.white54))
                          ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: PADDING,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: AppTheme.dark),
              children: [
                const TextSpan(text: "Author\n"),
                TextSpan(
                  text: "${product.author}",
                  style: AppFont.subtitle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          // Product description
          // Give a snippet
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: SnippetCard(snippet: aboutBody)),
          const SizedBox(
            height: 16,
          ),

          AppButton(
            title: "Buy",
            onTap: () {},
            background: Colors.blueGrey,
          ),
          Container(
            height: size.height / 2.5,
          )
        ],
      ),
    );
  }
}
