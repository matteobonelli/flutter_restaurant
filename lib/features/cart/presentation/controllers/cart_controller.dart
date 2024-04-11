import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';

import '../../../menu/data/models/product.dart';

class CartController extends GetxController {
  final List<CartLineProduct> cartList = [];
  double sum = 0.0;

  void addProduct(CartLineProduct cli) {
    for (final item in cartList) {
      if (item.product.id == cli.product.id) {
        item.quantity++;
        update();
        return;
      }
    }
    cartList.add(cli);

    update();
  }

  void removeProduct(CartLineProduct cli) {
    for (final item in cartList) {
      if (item.product.id == cli.product.id) {
        if (item.quantity == 1) {
          cartList.remove(item);
          update();
          return;
        } else {
          item.quantity--;
          update();
          return;
        }
      }
    }
  }

   double get total{
    sum = 0;
    for(final item in cartList){
      sum += (item.quantity * item.product.price);
    }
    update();
    return sum;
  }


}
