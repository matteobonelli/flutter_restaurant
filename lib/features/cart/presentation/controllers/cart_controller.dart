import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';
import 'package:project_x/utils/firestore_helper.dart';

import '../../../menu/data/models/product.dart';

class CartController extends GetxController {
  final List<CartLineProduct> cartList = [];
  double sum = 0;

  void getToCart(int index) async {
    if (index == 1) {
      return;
    }
    await FirestoreHelper.addItemsToCart("lu2nEnmDq1wkr5UOzj3f", cartList);
    Get.back();
  }

  void addProduct(Product product) {
    for (final item in cartList) {
      if (item.product.id == product.id) {
        item.quantity++;
        update();
        return;
      }
    }
    cartList.add(CartLineProduct(product: product));

    Get.snackbar('${product.name} è stato aggiunto!',
        'Hai aggiunto ${product.name} al tuo carrello!',
        backgroundColor: Colors.white.withOpacity(1));

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

  get total {
    sum = 0;
    for (final item in cartList) {
      sum += (item.quantity * item.product.price);
    }
    return sum.toStringAsFixed(2);
  }
}
