import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../cart/data/models/cart_line_product.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../../data/mock_data/mock_data.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.index, required this.cli});

  final int index;
  final CartLineProduct cli;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
              radius: 40, backgroundImage: NetworkImage(cli.product.image!)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(cli.product.name, style: TextStyle(overflow: TextOverflow.ellipsis),),
                Text(cli.product.priceString!),
                IconButton(onPressed: (){
                  controller.addProduct(cli);
                }, icon: Icon(Icons.add_circle))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
