import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';
import 'package:project_x/features/menu/data/mock_data/mock_data.dart';
import 'package:project_x/features/menu/presentation/controllers/menu_controller.dart';

import '../../../../utils/theme/theme_controller.dart';
import '../widgets/menu_item_card.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return GetBuilder<MenusController>(
      builder: (controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.logout),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              controller.logout();
            },
          ),
          title: Text(
            "Menù",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  themeController.toggleTheme();
                  controller.isSwitched = !controller.isSwitched;
                },
                icon: controller.isSwitched
                    ? const Icon(Icons.light_mode, color: Colors.yellowAccent,)
                    : const Icon(Icons.dark_mode))
          ],
        ),
        body: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItemCard(
                  index: index, product: controller.products[index]);
            }),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.tertiary,
          unselectedItemColor: Theme.of(context).colorScheme.tertiary,
          currentIndex: 0,
          onTap: (index) {
            controller.getToCart(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.lunch_dining,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                label: "Menù"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                label: "Carrello")
          ],
        ),
      ),
    );
  }
}
