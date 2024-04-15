import 'package:uuid/uuid.dart';

import '../../../menu/data/models/product.dart';

class CartLineProduct {
  String? id;
  String? cartId;
  final Product product;
  int quantity;

  CartLineProduct(
      {this.id,
      required this.cartId,
      required this.product,
      this.quantity = 1});

  get totalPrice{
    return (quantity * product.price).toStringAsFixed(2);
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'cartId' : cartId,
      'product' : product.id,
      'quantity' : quantity
    };
  }

}
