import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/presentation/pages/cart_view.dart';
import 'package:project_x/features/menu/presentation/pages/menu_view.dart';

import '../controllers/menu_controller.dart';

class LandingMenuCart extends StatelessWidget {
  const LandingMenuCart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenusController>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Obx(() => controller.indexBottom.value == 0 ? const MenuView() : const CartView()),
      bottomNavigationBar: Obx( () =>
        BottomNavigationBar(
          currentIndex: controller.indexBottom.value,
          onTap: (index){
            controller.getToPage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Menù"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrello")
          ],
        ),
      ),
    );
  }
}
