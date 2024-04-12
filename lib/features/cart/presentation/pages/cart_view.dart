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
      builder: (controller) => SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Carrello",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: controller.cartList.isEmpty
              ? const EmptyCart()
              : ListView.builder(
                  itemCount: controller.cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItemCard(
                        index: index, clp: controller.cartList[index]);
                  }),
          bottomSheet: controller.cartList.isEmpty
              ? null
              : BottomAppBar(
                  height: 70,
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Totale : ${controller.total} \$",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            onTap: (index) {
              controller.getToCart(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.lunch_dining), label: "Menù"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Carrello")
            ],
          ),
        ),
      ),
    );
  }
}
