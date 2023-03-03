// Selected menu
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/presentation/dashboard/cart/models/cart_item_model.dart';

final cartProvider = StateNotifierProvider<CartProvider, List>((ref) {
  return CartProvider();
});

class CartProvider extends StateNotifier<List<CartItemModel>> {
  CartProvider() : super([]);

  void setItems(List<CartItemModel> items) {
    state = items;
  }

  void addItem(CartItemModel item) {
    var items = state;
    if (items.contains(item)) {
      // do nothing
    } else {
      items.add(item);
    }
    state = items;
  }
}
