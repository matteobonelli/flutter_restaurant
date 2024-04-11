import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_x/features/cart/presentation/controllers/cart_controller.dart';

import '../../data/models/cart_line_product.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.index, required this.clp});

  final int index;
  final CartLineProduct clp;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                radius: 40, backgroundImage: NetworkImage(clp.product.image!)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Column(
                children: [
                  Text(
                    clp.product.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(clp.totalPrice, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      controller.addProduct(clp);
                    },
                    icon: const Icon(Icons.add_circle)),
                Text(controller.cartList[index].quantity.toString()),
                IconButton(
                    onPressed: () {
                      controller.removeProduct(clp);
                    },
                    icon: const Icon(Icons.remove_circle)),
              ],
            )

          ],
        ),
      ),
    );
  }
}
