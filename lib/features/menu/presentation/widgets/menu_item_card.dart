import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../cart/data/models/cart_line_product.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../../data/mock_data/mock_data.dart';
import '../../data/models/product.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.index, required this.product});

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                controller.addProduct(product);
              },
              child: CircleAvatar(
                  radius: 60, backgroundImage: NetworkImage(product.image!)),
            ),
            SizedBox(width: 12,),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(product.name, overflow: TextOverflow.fade, style: TextStyle(fontSize: 20),),
                          SizedBox(height: 8),
                          Text("${product.priceString!} \$", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){controller.addProduct(product);}, icon: Icon(Icons.add_circle))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
