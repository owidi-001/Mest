import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/home/models/book_model.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:mest/widgets/app_button.dart';

class DetailScreen extends StatelessWidget {
  final Book product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: PADDING),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: product.coverImage.toString().isNotEmpty
                  ? Hero(
                      tag: "",
                      child: Image.asset(
                        "${product.coverImage}",
                        fit: BoxFit.contain,
                      ),
                    )
                  : const Placeholder(),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: PADDING,
                right: PADDING,
              ),
              decoration: const BoxDecoration(
                color: Colors.white54,
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
                                const TextSpan(text: "Book Author\n"),
                                TextSpan(
                                  text: "${product.author}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: AppTheme.dark),
                              children: [
                                const TextSpan(
                                    text: "Numer of pages Quantity\n"),
                                TextSpan(
                                  text: "400",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
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
                  // Inform user on the action to take
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "You can adjust the quantity by the \t '+' \t or \t '-' \t buttons then proceed to add to cart.",
                      style: TextStyle(height: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  AppButton(title: "Buy", onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
