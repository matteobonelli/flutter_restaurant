import 'cart_line_product.dart';

class Cart{
  String? id;
  final List<CartLineProduct> items;
  final String? userId;

  Cart({this.id, required this.items, this.userId});
}