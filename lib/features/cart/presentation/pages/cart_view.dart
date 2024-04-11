import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/presentation/widget/cart_item_card.dart';
import 'package:project_x/features/cart/presentation/widget/empty_cart.dart';

import '../../../menu/presentation/pages/menu_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => controller.cartList.isEmpty
          ? const EmptyCart()
          : ListView.builder(
              itemCount: controller.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return CartItemCard(
                    index: index, clp: controller.cartList[index]);
              }),
    );
  }
}
