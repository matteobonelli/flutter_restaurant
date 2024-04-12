import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';
import 'package:project_x/features/menu/data/mock_data/mock_data.dart';
import 'package:project_x/features/menu/presentation/controllers/menu_controller.dart';

import '../widgets/menu_item_card.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MenusController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Menù", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItemCard(index: index, product: controller.products[index]);
            }),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            onTap: (index) {
              controller.getToCart(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Menù"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Carrello")
            ],
          ),
        ),
      );
  }
}
