import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';
import 'package:project_x/services/authentication_repository.dart';
import 'package:project_x/utils/firestore_helper.dart';
import 'package:uuid/uuid.dart';

import '../../../menu/data/models/product.dart';
import '../../../menu/presentation/controllers/menu_controller.dart';
import '../../data/models/cart.dart';

class CartController extends GetxController {
  final authController = Get.find<AuthenticationRepository>();
  final menuController = Get.find<MenusController>();
  late final Cart cart;
  late final List<CartLineProduct> cartList;
  double sum = 0;

  @override
  void onReady() async {
    cart = await FirestoreHelper.fetchCart(authController.firebaseUser.value?.uid.toString());
    cartList = cart.items;
    super.onReady();
  }

  void getToCart(int index) async {
    if (index == 1) {
      return;
    }
    await FirestoreHelper.addItemsToCart(cart.id, cartList);
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
    cartList.add(CartLineProduct(product: product, cartId: cart.id, id: const Uuid().v1()));

    Get.snackbar('${product.name} è stato aggiunto!',
        'Hai aggiunto ${product.name} al tuo carrello!',
        backgroundColor:
            menuController.isSwitched ? Colors.white : Colors.grey.shade900,
        colorText: menuController.isSwitched ? Colors.black : Colors.white);

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
