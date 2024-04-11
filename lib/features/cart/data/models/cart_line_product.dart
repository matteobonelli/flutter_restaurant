import '../../../menu/data/models/product.dart';

class CartLineProduct {
  String? id;
  String? cartId;
  final Product product;
  int quantity;

  CartLineProduct(
      {this.id,
      this.cartId,
      required this.product,
      this.quantity = 1});

  get totalPrice{
    return (quantity * product.price).toStringAsFixed(2);
  }

}