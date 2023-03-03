import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/home/models/book_model.dart';
import 'package:mest/presentation/dashboard/home/widgets/boot_info.dart';
import 'package:mest/presentation/dashboard/widgets/drawer.dart';
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
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height: size.height / 2.15,
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
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: .5,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: SnippetViewContent(
                  product: product,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
