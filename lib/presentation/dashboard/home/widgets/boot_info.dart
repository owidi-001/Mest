import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/home/models/book_model.dart';
import 'package:mest/presentation/dashboard/home/widgets/book_snippet.dart';
import 'package:mest/presentation/dashboard/widgets/drawer.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:mest/widgets/app_button.dart';

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
                child: Text(
                  product.title!,
                  style: const TextStyle(
                      color: AppTheme.dark,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
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
          // Product description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppTheme.dark),
                      children: [
                        TextSpan(text: "Year Published\n"),
                        TextSpan(text: "- 2019", style: AppFont.subtitle)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppTheme.dark),
                      children: [
                        TextSpan(text: "Pages\n"),
                        TextSpan(text: "- 400", style: AppFont.subtitle)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppTheme.dark),
                      children: [
                        TextSpan(text: "Time to read\n"),
                        TextSpan(text: "- 40 mins", style: AppFont.subtitle)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppTheme.dark),
                      children: [
                        TextSpan(text: "ISBN\n"),
                        TextSpan(
                            text: "- 4007492048120482", style: AppFont.subtitle)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
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
