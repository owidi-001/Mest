import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/presentation/dashboard/cart/models/cart_item_model.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

class CartItemWidget extends ConsumerWidget {
  final CartItemModel item;
  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                alignment: Alignment.center,
                child: item.product.coverImage.toString().isNotEmpty
                    ?
                    // Image.memory(
                    //     const Base64Decoder().convert(item.product.image),
                    //     fit: BoxFit.fill,
                    //   )
                    Image.asset(
                        "${item.product.coverImage}",
                        fit: BoxFit.fill,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: AppTheme.dark,
                            borderRadius: BorderRadius.circular(12)),
                      ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.title!,
                    style: AppFont.title.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 16,
                ),
                Text("Ksh. 50",
                    style: AppFont.subtitle.copyWith(
                        fontSize: 14,
                        color: AppTheme.gray,
                        fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
