import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/presentation/dashboard/cart/models/cart_item_model.dart';
import 'package:mest/presentation/dashboard/cart/provider/cart_provider.dart';
import 'package:mest/presentation/dashboard/cart/widgets/card_card_widget_skeleton.dart';
import 'package:mest/presentation/dashboard/cart/widgets/cart_card_widget.dart';
import 'package:mest/presentation/dashboard/home/models/book_model.dart';
import 'package:mest/presentation/dashboard/home/utils/shimmer_utils.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:mest/widgets/app_button.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = ref.watch(cartProvider);
    // var provider = [];

    var provider = List.generate(
      Book.dummy.length,
      (index) => CartItemModel(product: Book.dummy[index], quantity: 1),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Text("Shopping cart", style: AppFont.title),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("You have ${provider.length} items in cart",
                  style: AppFont.normal
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),

          const SliverToBoxAdapter(
            child: Divider(
              color: Colors.black38,
              thickness: 2,
            ),
          ),
          // spacer
          const SliverPadding(padding: EdgeInsets.all(8.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal:PADDING),
            sliver: SliverToBoxAdapter(
              child: ShimmerWidget(child: CartItemWidgetSkeleton()),
            ),
          ),
          // List view
          provider.isEmpty
              ? //check if customer has any items in cart
              SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.white54,
                    ),
                    child: const Center(
                      child: Text("No items in cart!", style: AppFont.title),
                    ),
                  ),
                )
              : //Show cart items list
              SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(((
                      context,
                      index,
                    ) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Column(
                          children: [
                            CartItemWidget(
                              item: provider[index],
                            ),
                            index != provider.length - 1
                                ? const Divider(
                                    color: AppTheme.dark,
                                  )
                                : Container()
                          ],
                        ),
                      );
                    }), childCount: provider.length),
                  ),
                ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(PADDING),
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total:",
                    style: AppFont.subtitle
                        .copyWith(color: AppTheme.gray, fontSize: 16),
                  ),
                  const Divider(),
                  Text(
                    "Ksh. 400",
                    style: AppFont.title.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
          ),

          // spacer
          const SliverPadding(padding: EdgeInsets.all(8.0)),

          // Checkout button
          SliverToBoxAdapter(
            child: AppButton(
              title: "Pay with mPesa",
              onTap: (() {
                const ScaffoldMessenger(
                  child: SnackBar(content: Text("Chill bro! working on it.")),
                );
              }),
              background: AppTheme.dark,
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: PADDING * 5),
          ),
        ],
      ),
    );
  }
}
