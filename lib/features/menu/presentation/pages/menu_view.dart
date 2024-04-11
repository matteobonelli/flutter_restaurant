import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/presentation/pages/cart_view.dart';
import 'package:project_x/features/menu/data/mock_data/mock_data.dart';

import '../widgets/menu_item_card.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItemCard(index: index);
          });
  }
}
