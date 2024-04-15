import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/presentation/widget/cart_item_card.dart';
import 'package:project_x/features/cart/presentation/widget/empty_cart.dart';

import '../../../../utils/theme/theme_controller.dart';
import '../../../menu/presentation/pages/menu_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetBuilder<CartController>(
      builder: (controller) => SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Carrello",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    themeController.toggleTheme();
                    themeController.isSwitched = !themeController.isSwitched;
                  },
                  icon: themeController.isSwitched
                      ? const Icon(Icons.light_mode, color: Colors.yellowAccent,)
                      : const Icon(Icons.dark_mode))
            ],
          ),
          body: controller.cartList.isEmpty
              ? const EmptyCart()
              : ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
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
            selectedItemColor: Theme.of(context).colorScheme.tertiary,
            unselectedItemColor: Theme.of(context).colorScheme.tertiary,
            currentIndex: 1,
            onTap: (index) {
              controller.getToCart(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.lunch_dining, color: Theme.of(context).colorScheme.tertiary,), label: "Menù"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Theme.of(context).colorScheme.tertiary,), label: "Carrello")
            ],
          ),
        ),
      ),
    );
  }
}
