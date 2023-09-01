import 'package:mest/features/dashboard/home/models/book_model.dart';

class CartItemModel {
  late final Book product;
  late final int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });

  CartItemModel copyWith({Book? product, int? quantity}) {
    return CartItemModel(
        product: product ?? this.product, quantity: quantity ?? this.quantity);
  }

  static Map<String, dynamic> toMap(CartItemModel item) {
    Map<String, dynamic> data = {
      "product": item.product,
      "quantity": item.quantity
    };

    return data;
  }
}
